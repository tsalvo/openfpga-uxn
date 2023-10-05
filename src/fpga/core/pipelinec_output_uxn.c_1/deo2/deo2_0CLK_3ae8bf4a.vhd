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
-- Submodules: 162
entity deo2_0CLK_3ae8bf4a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_3ae8bf4a;
architecture arch of deo2_0CLK_3ae8bf4a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l500_c6_1f87]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_576d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l508_c7_e537]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c2_93a7]
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l500_c2_93a7]
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c2_93a7]
signal n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c2_93a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l500_c2_93a7]
signal l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l500_c2_93a7]
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c2_93a7]
signal t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l500_c2_93a7]
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l500_c2_93a7]
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l501_c3_f89c[uxn_opcodes_h_l501_c3_f89c]
signal printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l508_c11_e9ec]
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c7_7488]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l508_c7_e537]
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l508_c7_e537]
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l508_c7_e537]
signal n8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l508_c7_e537]
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l508_c7_e537]
signal l8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l508_c7_e537]
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l508_c7_e537]
signal t8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l508_c7_e537]
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l508_c7_e537]
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l511_c11_8ef3]
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l511_c7_7488]
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l511_c7_7488]
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l511_c7_7488]
signal n8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l511_c7_7488]
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l511_c7_7488]
signal l8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l511_c7_7488]
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l511_c7_7488]
signal t8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l511_c7_7488]
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l511_c7_7488]
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l515_c11_4292]
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l518_c7_b547]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l515_c7_6d2e]
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l518_c11_d42e]
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c7_94fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l518_c7_b547]
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l518_c7_b547]
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l518_c7_b547]
signal n8_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l518_c7_b547]
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l518_c7_b547]
signal l8_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l518_c7_b547]
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l518_c7_b547]
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l518_c7_b547]
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l522_c11_c5b2]
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c7_bb77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l522_c7_94fe]
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l522_c7_94fe]
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l522_c7_94fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l522_c7_94fe]
signal l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l522_c7_94fe]
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l522_c7_94fe]
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l522_c7_94fe]
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l525_c11_6f96]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_b8e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l525_c7_bb77]
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l525_c7_bb77]
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c7_bb77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l525_c7_bb77]
signal l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l525_c7_bb77]
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l525_c7_bb77]
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l525_c7_bb77]
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l530_c32_d000]
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l530_c32_452c]
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l530_c32_ea7d]
signal MUX_uxn_opcodes_h_l530_c32_ea7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_ea7d_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l535_c32_fbc0]
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l535_c16_dd13]
signal MUX_uxn_opcodes_h_l535_c16_dd13_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_dd13_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_dd13_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_dd13_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l536_c16_986b]
signal MUX_uxn_opcodes_h_l536_c16_986b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_986b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_986b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_986b_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l537_c23_e1fa]
signal device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_e1fa_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_e1fa_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_e1fa_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_e1fa_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l545_c24_0fd7]
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l546_c3_2d78]
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l546_c3_2d78]
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l550_c4_38da]
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbca( ref_toks_0 : opcode_result_t;
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
 ref_toks_11 : signed;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.device_ram_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_device_ram_read := ref_toks_9;
      base.vram_address := ref_toks_10;
      base.sp_relative_shift := ref_toks_11;
      base.is_opc_done := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87
BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7
device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7
deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c2_93a7
n8_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7
result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7
result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- l8_MUX_uxn_opcodes_h_l500_c2_93a7
l8_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7
is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c2_93a7
t8_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7
deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond,
deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue,
deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse,
deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

-- printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c
printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c : entity work.printf_uxn_opcodes_h_l501_c3_f89c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec
BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left,
BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right,
BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l508_c7_e537
device_out_result_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond,
device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l508_c7_e537
deo_param0_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond,
deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- n8_MUX_uxn_opcodes_h_l508_c7_e537
n8_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l508_c7_e537_cond,
n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537
result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537
result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- l8_MUX_uxn_opcodes_h_l508_c7_e537
l8_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l508_c7_e537_cond,
l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537
is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- t8_MUX_uxn_opcodes_h_l508_c7_e537
t8_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l508_c7_e537_cond,
t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l508_c7_e537
deo_param1_MUX_uxn_opcodes_h_l508_c7_e537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond,
deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue,
deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse,
deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3
BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left,
BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right,
BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l511_c7_7488
device_out_result_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond,
device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l511_c7_7488
deo_param0_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond,
deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- n8_MUX_uxn_opcodes_h_l511_c7_7488
n8_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l511_c7_7488_cond,
n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488
result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488
result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- l8_MUX_uxn_opcodes_h_l511_c7_7488
l8_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l511_c7_7488_cond,
l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488
is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- t8_MUX_uxn_opcodes_h_l511_c7_7488
t8_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l511_c7_7488_cond,
t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l511_c7_7488
deo_param1_MUX_uxn_opcodes_h_l511_c7_7488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond,
deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue,
deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse,
deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292
BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left,
BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right,
BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e
device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e
deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- n8_MUX_uxn_opcodes_h_l515_c7_6d2e
n8_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e
result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e
result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- l8_MUX_uxn_opcodes_h_l515_c7_6d2e
l8_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e
is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e
deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond,
deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e
BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left,
BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right,
BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l518_c7_b547
device_out_result_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond,
device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l518_c7_b547
deo_param0_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond,
deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- n8_MUX_uxn_opcodes_h_l518_c7_b547
n8_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l518_c7_b547_cond,
n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547
result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547
result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- l8_MUX_uxn_opcodes_h_l518_c7_b547
l8_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l518_c7_b547_cond,
l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547
is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l518_c7_b547
deo_param1_MUX_uxn_opcodes_h_l518_c7_b547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond,
deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue,
deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse,
deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2
BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left,
BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right,
BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe
device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe
deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe
result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe
result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- l8_MUX_uxn_opcodes_h_l522_c7_94fe
l8_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe
is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe
deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond,
deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue,
deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse,
deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77
device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77
deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77
result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77
result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- l8_MUX_uxn_opcodes_h_l525_c7_bb77
l8_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77
is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77
deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond,
deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue,
deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse,
deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l530_c32_d000
BIN_OP_AND_uxn_opcodes_h_l530_c32_d000 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left,
BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right,
BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l530_c32_452c
BIN_OP_GT_uxn_opcodes_h_l530_c32_452c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left,
BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right,
BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output);

-- MUX_uxn_opcodes_h_l530_c32_ea7d
MUX_uxn_opcodes_h_l530_c32_ea7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l530_c32_ea7d_cond,
MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue,
MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse,
MUX_uxn_opcodes_h_l530_c32_ea7d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left,
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right,
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output);

-- MUX_uxn_opcodes_h_l535_c16_dd13
MUX_uxn_opcodes_h_l535_c16_dd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l535_c16_dd13_cond,
MUX_uxn_opcodes_h_l535_c16_dd13_iftrue,
MUX_uxn_opcodes_h_l535_c16_dd13_iffalse,
MUX_uxn_opcodes_h_l535_c16_dd13_return_output);

-- MUX_uxn_opcodes_h_l536_c16_986b
MUX_uxn_opcodes_h_l536_c16_986b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l536_c16_986b_cond,
MUX_uxn_opcodes_h_l536_c16_986b_iftrue,
MUX_uxn_opcodes_h_l536_c16_986b_iffalse,
MUX_uxn_opcodes_h_l536_c16_986b_return_output);

-- device_out_uxn_opcodes_h_l537_c23_e1fa
device_out_uxn_opcodes_h_l537_c23_e1fa : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l537_c23_e1fa_device_address,
device_out_uxn_opcodes_h_l537_c23_e1fa_value,
device_out_uxn_opcodes_h_l537_c23_e1fa_phase,
device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read,
device_out_uxn_opcodes_h_l537_c23_e1fa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7
BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left,
BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right,
BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78
is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left,
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right,
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output,
 BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output,
 BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output,
 MUX_uxn_opcodes_h_l530_c32_ea7d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output,
 MUX_uxn_opcodes_h_l535_c16_dd13_return_output,
 MUX_uxn_opcodes_h_l536_c16_986b_return_output,
 device_out_uxn_opcodes_h_l537_c23_e1fa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_32ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l506_c3_4700 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_44c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_3671 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_956f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_1e5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_5056 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_541b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_bb77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_3abb : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_dd13_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_dd13_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_986b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_986b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_986b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_986b_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_5090_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_d0e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_a421_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_de1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2e1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_c761_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_4e61_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l547_c4_01a2 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l550_c4_76e7 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l554_l493_DUPLICATE_f93e_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_1e5c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_1e5c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_3671 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_3671;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_541b := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_541b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_44c1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_44c1;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l547_c4_01a2 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l547_c4_01a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_5056 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_5056;
     VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_current_deo_phase_uxn_opcodes_h_l506_c3_4700 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l506_c3_4700;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_956f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_956f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_32ab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_32ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_3abb := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_3abb;
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l535_c16_dd13_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l536_c16_986b_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l536_c16_986b_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l536_c16_986b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left := t8;
     VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l515_c11_4292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_left;
     BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output := BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output := result.device_ram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l508_c11_e9ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l518_c11_d42e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_left;
     BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output := BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output := result.is_device_ram_read;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_bb77_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l535_c32_fbc0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c11_6f96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l511_c11_8ef3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_left;
     BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output := BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l530_c32_d000] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_left;
     BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output := BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output;

     -- MUX[uxn_opcodes_h_l536_c16_986b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l536_c16_986b_cond <= VAR_MUX_uxn_opcodes_h_l536_c16_986b_cond;
     MUX_uxn_opcodes_h_l536_c16_986b_iftrue <= VAR_MUX_uxn_opcodes_h_l536_c16_986b_iftrue;
     MUX_uxn_opcodes_h_l536_c16_986b_iffalse <= VAR_MUX_uxn_opcodes_h_l536_c16_986b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l536_c16_986b_return_output := MUX_uxn_opcodes_h_l536_c16_986b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c6_1f87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l522_c11_c5b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output := result.vram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output := result.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output := result.device_ram_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l550_c4_38da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_d000_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_1f87_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_e9ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_8ef3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_4292_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_d42e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_c5b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6f96_return_output;
     VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_fbc0_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l550_c4_76e7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_38da_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_5f90_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9f3e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_4c7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_724b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l518_l522_l508_l511_l500_l515_DUPLICATE_9989_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l515_DUPLICATE_0e61_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_2f37_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_b5ec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_ef91_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_d80f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l518_l522_l508_l525_l511_l500_l515_DUPLICATE_9af4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_MUX_uxn_opcodes_h_l536_c16_986b_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_value := VAR_MUX_uxn_opcodes_h_l536_c16_986b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l550_c4_76e7;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_576d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- t8_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output := t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- l8_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- n8_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output := n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l530_c32_452c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_left;
     BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output := BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output;

     -- MUX[uxn_opcodes_h_l535_c16_dd13] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l535_c16_dd13_cond <= VAR_MUX_uxn_opcodes_h_l535_c16_dd13_cond;
     MUX_uxn_opcodes_h_l535_c16_dd13_iftrue <= VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iftrue;
     MUX_uxn_opcodes_h_l535_c16_dd13_iffalse <= VAR_MUX_uxn_opcodes_h_l535_c16_dd13_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l535_c16_dd13_return_output := MUX_uxn_opcodes_h_l535_c16_dd13_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_452c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_MUX_uxn_opcodes_h_l535_c16_dd13_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_device_address := VAR_MUX_uxn_opcodes_h_l535_c16_dd13_return_output;
     VAR_printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_576d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_l8_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_t8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     -- l8_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- n8_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- printf_uxn_opcodes_h_l501_c3_f89c[uxn_opcodes_h_l501_c3_f89c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l501_c3_f89c_uxn_opcodes_h_l501_c3_f89c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l530_c32_ea7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l530_c32_ea7d_cond <= VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_cond;
     MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue <= VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iftrue;
     MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse <= VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_return_output := MUX_uxn_opcodes_h_l530_c32_ea7d_return_output;

     -- t8_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output := t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue := VAR_MUX_uxn_opcodes_h_l530_c32_ea7d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_l8_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_n8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     -- n8_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output := n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- l8_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output := l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output := deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_n8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     -- n8_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output := n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- l8_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output := deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_l8_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output := deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- l8_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output := l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_l8_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- l8_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output := l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output := deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output := deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_l8_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_b8e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output := deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- l8_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_b8e4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     -- device_out[uxn_opcodes_h_l537_c23_e1fa] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l537_c23_e1fa_device_address <= VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_device_address;
     device_out_uxn_opcodes_h_l537_c23_e1fa_value <= VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_value;
     device_out_uxn_opcodes_h_l537_c23_e1fa_phase <= VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_phase;
     device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output := device_out_uxn_opcodes_h_l537_c23_e1fa_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.is_deo_done;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l544_c23_4e61] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_4e61_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.vram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l543_c25_c761] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_c761_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l539_c31_d0e0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_d0e0_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l540_c31_a421] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_a421_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l538_c32_5090] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_5090_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l541_c29_de1d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_de1d_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l542_c26_2e1c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2e1c_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_e1fa_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_854e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_d0e0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_5090_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2e1c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_4e61_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_c761_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_a421_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_de1d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l545_c24_0fd7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_left;
     BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output := BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l546_c3_2d78] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_cond;
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output := is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l546_c3_2d78] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output := current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_0fd7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_2d78_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_2d78_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l525_c7_bb77] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_cond;
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output := is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output := device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_bb77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l522_c7_94fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_94fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output := is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l518_c7_b547] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output := current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output := device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_b547_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output := device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l515_c7_6d2e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_6d2e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output := is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output := current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l511_c7_7488] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_7488_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output := is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l508_c7_e537] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output := current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_e537_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l500_c2_93a7] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output := current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_93a7_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l554_l493_DUPLICATE_f93e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l554_l493_DUPLICATE_f93e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbca(
     result,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_93a7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_93a7_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l554_l493_DUPLICATE_f93e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l554_l493_DUPLICATE_f93e_return_output;
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
