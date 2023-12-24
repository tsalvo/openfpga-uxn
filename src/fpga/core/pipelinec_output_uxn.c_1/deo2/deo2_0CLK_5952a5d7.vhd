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
entity deo2_0CLK_5952a5d7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_5952a5d7;
architecture arch of deo2_0CLK_5952a5d7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_f666]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_82ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_a786]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_a786]
signal l8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_a786]
signal n8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_a786]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_a786]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_a786]
signal result_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_a786_return_output : opcode_result_t;

-- t8_MUX[uxn_opcodes_h_l539_c2_a786]
signal t8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_a786]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_a786]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_a786]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_a786]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_d32c]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_1131]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_82ec]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_82ec]
signal l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_82ec]
signal n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_82ec]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_82ec]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_82ec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_82ec]
signal t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_82ec]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_82ec]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_82ec]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_82ec]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_bc79]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_16b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_1131]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_1131]
signal l8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_1131]
signal n8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_1131]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_1131]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_1131]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_1131]
signal t8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_1131]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_1131]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_1131]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_1131]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_2c13]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_1c52]
signal MUX_uxn_opcodes_h_l562_c17_1c52_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1c52_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1c52_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1c52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_3a70]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_c2b5]
signal MUX_uxn_opcodes_h_l563_c17_c2b5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c2b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_4184]
signal MUX_uxn_opcodes_h_l564_c8_4184_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_4184_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_4184_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_4184_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_012a]
signal MUX_uxn_opcodes_h_l565_c8_012a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_012a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_012a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_012a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_3789]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_d719]
signal MUX_uxn_opcodes_h_l566_c16_d719_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_d719_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_d719_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_d719_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_2b65]
signal MUX_uxn_opcodes_h_l567_c16_2b65_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_2b65_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_2b65_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_2b65_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_58d6]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_6849]
signal MUX_uxn_opcodes_h_l568_c30_6849_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6849_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6849_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6849_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_2aeb]
signal device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2aeb_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_ed40]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_f622]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_f622]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_51de]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.device_ram_address := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_a786
deo_param0_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_a786
l8_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_a786_cond,
l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_a786
n8_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_a786_cond,
n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_a786
deo_param1_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_a786
result_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_a786_cond,
result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_a786
t8_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_a786_cond,
t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786
is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786
is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_a786
device_out_result_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786
is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c
BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec
deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_82ec
l8_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_82ec
n8_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec
deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec
result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec
result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_82ec
t8_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec
is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec
is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec
device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec
is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79
BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_1131
deo_param0_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_1131
l8_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_1131_cond,
l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_1131
n8_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_1131_cond,
n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_1131
deo_param1_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131
result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131
result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_1131
t8_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_1131_cond,
t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131
is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131
is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_1131
device_out_result_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131
is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13
BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output);

-- MUX_uxn_opcodes_h_l562_c17_1c52
MUX_uxn_opcodes_h_l562_c17_1c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_1c52_cond,
MUX_uxn_opcodes_h_l562_c17_1c52_iftrue,
MUX_uxn_opcodes_h_l562_c17_1c52_iffalse,
MUX_uxn_opcodes_h_l562_c17_1c52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70
BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output);

-- MUX_uxn_opcodes_h_l563_c17_c2b5
MUX_uxn_opcodes_h_l563_c17_c2b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_c2b5_cond,
MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue,
MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse,
MUX_uxn_opcodes_h_l563_c17_c2b5_return_output);

-- MUX_uxn_opcodes_h_l564_c8_4184
MUX_uxn_opcodes_h_l564_c8_4184 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_4184_cond,
MUX_uxn_opcodes_h_l564_c8_4184_iftrue,
MUX_uxn_opcodes_h_l564_c8_4184_iffalse,
MUX_uxn_opcodes_h_l564_c8_4184_return_output);

-- MUX_uxn_opcodes_h_l565_c8_012a
MUX_uxn_opcodes_h_l565_c8_012a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_012a_cond,
MUX_uxn_opcodes_h_l565_c8_012a_iftrue,
MUX_uxn_opcodes_h_l565_c8_012a_iffalse,
MUX_uxn_opcodes_h_l565_c8_012a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output);

-- MUX_uxn_opcodes_h_l566_c16_d719
MUX_uxn_opcodes_h_l566_c16_d719 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_d719_cond,
MUX_uxn_opcodes_h_l566_c16_d719_iftrue,
MUX_uxn_opcodes_h_l566_c16_d719_iffalse,
MUX_uxn_opcodes_h_l566_c16_d719_return_output);

-- MUX_uxn_opcodes_h_l567_c16_2b65
MUX_uxn_opcodes_h_l567_c16_2b65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_2b65_cond,
MUX_uxn_opcodes_h_l567_c16_2b65_iftrue,
MUX_uxn_opcodes_h_l567_c16_2b65_iffalse,
MUX_uxn_opcodes_h_l567_c16_2b65_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_58d6
sp_relative_shift_uxn_opcodes_h_l568_c43_58d6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output);

-- MUX_uxn_opcodes_h_l568_c30_6849
MUX_uxn_opcodes_h_l568_c30_6849 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_6849_cond,
MUX_uxn_opcodes_h_l568_c30_6849_iftrue,
MUX_uxn_opcodes_h_l568_c30_6849_iffalse,
MUX_uxn_opcodes_h_l568_c30_6849_return_output);

-- device_out_uxn_opcodes_h_l569_c23_2aeb
device_out_uxn_opcodes_h_l569_c23_2aeb : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_2aeb_device_address,
device_out_uxn_opcodes_h_l569_c23_2aeb_value,
device_out_uxn_opcodes_h_l569_c23_2aeb_phase,
device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_2aeb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40
BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622
is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output,
 MUX_uxn_opcodes_h_l562_c17_1c52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output,
 MUX_uxn_opcodes_h_l563_c17_c2b5_return_output,
 MUX_uxn_opcodes_h_l564_c8_4184_return_output,
 MUX_uxn_opcodes_h_l565_c8_012a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output,
 MUX_uxn_opcodes_h_l566_c16_d719_return_output,
 MUX_uxn_opcodes_h_l567_c16_2b65_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output,
 MUX_uxn_opcodes_h_l568_c30_6849_return_output,
 device_out_uxn_opcodes_h_l569_c23_2aeb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_352a : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_a786_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l539_c2_a786_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_6d7c : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_71dd : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_ec06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_d3b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_1131_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1c52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1c52_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_4184_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_4184_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_4184_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_4184_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_012a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_012a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_012a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_012a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_d719_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_d719_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_d719_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_d719_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_2b65_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_2b65_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6849_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6849_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6849_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6849_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_e0db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_8dbe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d209_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_95aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3ed9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_5774_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_79a1 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_39c2 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8f8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_9dc5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aa9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ccc4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d96b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_38c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_7375_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c_return_output : unsigned(0 downto 0);
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
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y := resize(to_signed(-3, 3), 4);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_71dd := resize(to_unsigned(1, 1), 4);
     VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_352a := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_352a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_79a1 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_79a1;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l568_c30_6849_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_ec06 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_ec06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_6d7c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_d3b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_d3b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right := to_unsigned(3, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_d719_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_2b65_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_4184_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_012a_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_4184_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_012a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_d719_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_3a70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_1131_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a03 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a03_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_bc79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aa9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aa9d_return_output := result.is_vram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_a786_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_6d7c,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_71dd,
     to_unsigned(0, 1));

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ccc4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ccc4_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_3789] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_51de] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_2c13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_58d6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8f8c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8f8c_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_38c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_38c8_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d96b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d96b_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_7375 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_7375_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_f666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_9dc5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_9dc5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_d32c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f666_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_d32c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_bc79_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_1c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_2c13_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_3a70_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_d719_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_3789_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_39c2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_51de_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ccc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ccc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_9dc5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_9dc5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_38c8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_38c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a03_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aa9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aa9d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d96b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d96b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_7375_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_7375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8f8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8f8c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_6849_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_58d6_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_39c2;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output := t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_d719] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_d719_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_d719_cond;
     MUX_uxn_opcodes_h_l566_c16_d719_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_d719_iftrue;
     MUX_uxn_opcodes_h_l566_c16_d719_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_d719_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_d719_return_output := MUX_uxn_opcodes_h_l566_c16_d719_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_1c52] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_1c52_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_1c52_cond;
     MUX_uxn_opcodes_h_l562_c17_1c52_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iftrue;
     MUX_uxn_opcodes_h_l562_c17_1c52_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_1c52_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_1c52_return_output := MUX_uxn_opcodes_h_l562_c17_1c52_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_c2b5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_c2b5_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_cond;
     MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iftrue;
     MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_return_output := MUX_uxn_opcodes_h_l563_c17_c2b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_4184_cond := VAR_MUX_uxn_opcodes_h_l562_c17_1c52_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_6849_cond := VAR_MUX_uxn_opcodes_h_l562_c17_1c52_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_1c52_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_012a_cond := VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_c2b5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_d719_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_d719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     -- t8_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_012a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_012a_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_012a_cond;
     MUX_uxn_opcodes_h_l565_c8_012a_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_012a_iftrue;
     MUX_uxn_opcodes_h_l565_c8_012a_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_012a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_012a_return_output := MUX_uxn_opcodes_h_l565_c8_012a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_6849] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_6849_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_6849_cond;
     MUX_uxn_opcodes_h_l568_c30_6849_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_6849_iftrue;
     MUX_uxn_opcodes_h_l568_c30_6849_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_6849_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_6849_return_output := MUX_uxn_opcodes_h_l568_c30_6849_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_4184] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_4184_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_4184_cond;
     MUX_uxn_opcodes_h_l564_c8_4184_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_4184_iftrue;
     MUX_uxn_opcodes_h_l564_c8_4184_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_4184_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_4184_return_output := MUX_uxn_opcodes_h_l564_c8_4184_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_4184_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_4184_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_012a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_012a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_6849_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     -- l8_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output := l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output := t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_16b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output := n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_2b65] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_2b65_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_2b65_cond;
     MUX_uxn_opcodes_h_l567_c16_2b65_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iftrue;
     MUX_uxn_opcodes_h_l567_c16_2b65_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_2b65_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_2b65_return_output := MUX_uxn_opcodes_h_l567_c16_2b65_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_16b4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_2b65_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_value := VAR_MUX_uxn_opcodes_h_l567_c16_2b65_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_2aeb] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_2aeb_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_device_address;
     device_out_uxn_opcodes_h_l569_c23_2aeb_value <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_value;
     device_out_uxn_opcodes_h_l569_c23_2aeb_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_phase;
     device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output := device_out_uxn_opcodes_h_l569_c23_2aeb_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- n8_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- l8_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_e0db] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_e0db_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_d209] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d209_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.is_vram_write;

     -- n8_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output := n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- l8_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output := l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.is_deo_done;

     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_5774] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_5774_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_8dbe] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_8dbe_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_95aa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_95aa_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_3ed9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3ed9_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2aeb_return_output.u16_addr;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3ed9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_8a8c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_e0db_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d209_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_95aa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_8dbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_5774_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_f622] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_f622] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_ed40] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_ed40_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_f622_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_f622_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_1131] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_1131_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_82ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_82ec_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l539_c2_a786_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_82ec_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_82ec_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l539_c2_a786_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_a786] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_a786_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_cond;
     result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output := result_MUX_uxn_opcodes_h_l539_c2_a786_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_a786_return_output;
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
