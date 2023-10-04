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
-- BIN_OP_EQ[uxn_opcodes_h_l500_c6_9718]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_736b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l500_c2_23d9]
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c2_23d9]
signal n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c2_23d9]
signal t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l500_c2_23d9]
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l500_c2_23d9]
signal l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l500_c2_23d9]
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c2_23d9]
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l500_c2_23d9]
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l500_c2_23d9]
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l501_c3_1eaa[uxn_opcodes_h_l501_c3_1eaa]
signal printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l508_c11_7e5b]
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c7_97b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l508_c7_a0a1]
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l511_c11_a22b]
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l515_c7_f9da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l511_c7_97b5]
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l511_c7_97b5]
signal n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l511_c7_97b5]
signal t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l511_c7_97b5]
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l511_c7_97b5]
signal l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l511_c7_97b5]
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l511_c7_97b5]
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l511_c7_97b5]
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l511_c7_97b5]
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l515_c11_b109]
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l518_c7_f82e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l515_c7_f9da]
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l515_c7_f9da]
signal n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l515_c7_f9da]
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l515_c7_f9da]
signal l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l515_c7_f9da]
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l515_c7_f9da]
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l515_c7_f9da]
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l515_c7_f9da]
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l518_c11_8334]
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l518_c7_f82e]
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l518_c7_f82e]
signal n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l518_c7_f82e]
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l518_c7_f82e]
signal l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l518_c7_f82e]
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l518_c7_f82e]
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l518_c7_f82e]
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l518_c7_f82e]
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l522_c11_04d5]
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l522_c7_1ef6]
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l525_c11_6938]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_05a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : device_out_result_t;

-- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(1 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l525_c7_a4d1]
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l530_c32_40f2]
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l530_c32_29d0]
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l530_c32_9bc5]
signal MUX_uxn_opcodes_h_l530_c32_9bc5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l530_c32_9bc5_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l535_c32_d79e]
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l535_c16_4449]
signal MUX_uxn_opcodes_h_l535_c16_4449_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_4449_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_4449_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l535_c16_4449_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l536_c16_3329]
signal MUX_uxn_opcodes_h_l536_c16_3329_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_3329_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_3329_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c16_3329_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l537_c23_96f8]
signal device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_96f8_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_96f8_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_96f8_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_96f8_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l545_c24_39ae]
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l546_c3_8bf9]
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l546_c3_8bf9]
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l550_c4_1630]
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.device_ram_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.vram_address := ref_toks_11;
      base.vram_value := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718
BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c2_23d9
n8_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c2_23d9
t8_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9
is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- l8_MUX_uxn_opcodes_h_l500_c2_23d9
l8_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9
deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9
device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9
result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9
result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9
deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond,
deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue,
deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse,
deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

-- printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa
printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa : entity work.printf_uxn_opcodes_h_l501_c3_1eaa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b
BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left,
BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right,
BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- n8_MUX_uxn_opcodes_h_l508_c7_a0a1
n8_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- t8_MUX_uxn_opcodes_h_l508_c7_a0a1
t8_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1
is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- l8_MUX_uxn_opcodes_h_l508_c7_a0a1
l8_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1
deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1
device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1
result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1
result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1
deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond,
deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b
BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left,
BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right,
BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- n8_MUX_uxn_opcodes_h_l511_c7_97b5
n8_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- t8_MUX_uxn_opcodes_h_l511_c7_97b5
t8_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5
is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- l8_MUX_uxn_opcodes_h_l511_c7_97b5
l8_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5
deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5
device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5
result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5
result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5
deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond,
deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109
BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left,
BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right,
BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- n8_MUX_uxn_opcodes_h_l515_c7_f9da
n8_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da
is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- l8_MUX_uxn_opcodes_h_l515_c7_f9da
l8_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da
deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da
device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da
result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da
result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da
deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond,
deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue,
deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse,
deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334
BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left,
BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right,
BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- n8_MUX_uxn_opcodes_h_l518_c7_f82e
n8_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e
is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- l8_MUX_uxn_opcodes_h_l518_c7_f82e
l8_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e
deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e
device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e
result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e
result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e
deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond,
deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5
BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left,
BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right,
BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6
is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- l8_MUX_uxn_opcodes_h_l522_c7_1ef6
l8_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6
deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6
device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6
result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6
result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6
deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond,
deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue,
deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse,
deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1
is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- l8_MUX_uxn_opcodes_h_l525_c7_a4d1
l8_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1
deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1
device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1
result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1
result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1
deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond,
deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2
BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left,
BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right,
BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0
BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left,
BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right,
BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output);

-- MUX_uxn_opcodes_h_l530_c32_9bc5
MUX_uxn_opcodes_h_l530_c32_9bc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l530_c32_9bc5_cond,
MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue,
MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse,
MUX_uxn_opcodes_h_l530_c32_9bc5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left,
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right,
BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output);

-- MUX_uxn_opcodes_h_l535_c16_4449
MUX_uxn_opcodes_h_l535_c16_4449 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l535_c16_4449_cond,
MUX_uxn_opcodes_h_l535_c16_4449_iftrue,
MUX_uxn_opcodes_h_l535_c16_4449_iffalse,
MUX_uxn_opcodes_h_l535_c16_4449_return_output);

-- MUX_uxn_opcodes_h_l536_c16_3329
MUX_uxn_opcodes_h_l536_c16_3329 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l536_c16_3329_cond,
MUX_uxn_opcodes_h_l536_c16_3329_iftrue,
MUX_uxn_opcodes_h_l536_c16_3329_iffalse,
MUX_uxn_opcodes_h_l536_c16_3329_return_output);

-- device_out_uxn_opcodes_h_l537_c23_96f8
device_out_uxn_opcodes_h_l537_c23_96f8 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l537_c23_96f8_device_address,
device_out_uxn_opcodes_h_l537_c23_96f8_value,
device_out_uxn_opcodes_h_l537_c23_96f8_phase,
device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read,
device_out_uxn_opcodes_h_l537_c23_96f8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae
BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left,
BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right,
BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9
is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left,
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right,
BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output,
 MUX_uxn_opcodes_h_l530_c32_9bc5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output,
 MUX_uxn_opcodes_h_l535_c16_4449_return_output,
 MUX_uxn_opcodes_h_l536_c16_3329_return_output,
 device_out_uxn_opcodes_h_l537_c23_96f8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l506_c3_e943 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_fecd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_d766 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_2717 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_0768 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_20ff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_3a1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5ba3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_a4d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_75d4 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_4449_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_4449_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_4449_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l535_c16_4449_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_3329_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_3329_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_3329_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c16_3329_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_fa1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_f528_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_6442_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_fba7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_afb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_1fd5_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_459e_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l547_c4_3254 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l550_c4_85f0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l554_l493_DUPLICATE_adc6_return_output : opcode_result_t;
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
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l506_c3_e943 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l506_c3_e943;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_0768 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l516_c3_0768;
     VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5ba3 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5ba3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_2717 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l513_c3_2717;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_20ff := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l520_c3_20ff;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_d766 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c3_d766;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_fecd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l503_c3_fecd;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_3a1e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l523_c3_3a1e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse := resize(to_signed(-3, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_75d4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l534_c3_75d4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l547_c4_3254 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l547_c4_3254;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l535_c16_4449_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l536_c16_3329_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l536_c16_3329_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l536_c16_3329_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left := t8;
     VAR_MUX_uxn_opcodes_h_l535_c16_4449_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l515_c11_b109] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_left;
     BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output := BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_a4d1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l511_c11_a22b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_left;
     BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output := BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;

     -- MUX[uxn_opcodes_h_l536_c16_3329] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l536_c16_3329_cond <= VAR_MUX_uxn_opcodes_h_l536_c16_3329_cond;
     MUX_uxn_opcodes_h_l536_c16_3329_iftrue <= VAR_MUX_uxn_opcodes_h_l536_c16_3329_iftrue;
     MUX_uxn_opcodes_h_l536_c16_3329_iffalse <= VAR_MUX_uxn_opcodes_h_l536_c16_3329_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l536_c16_3329_return_output := MUX_uxn_opcodes_h_l536_c16_3329_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l522_c11_04d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c6_9718] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l535_c32_d79e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c11_6938] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l508_c11_7e5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l550_c4_1630] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_left;
     BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output := BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output := result.vram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l518_c11_8334] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_left;
     BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output := BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l530_c32_40f2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_left;
     BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output := BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l530_c32_40f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c6_9718_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l508_c11_7e5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l511_c11_a22b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l515_c11_b109_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l518_c11_8334_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c11_04d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c11_6938_return_output;
     VAR_MUX_uxn_opcodes_h_l535_c16_4449_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l535_c32_d79e_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l550_c4_85f0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l550_c4_1630_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_8641_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_9455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_418c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_3253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l511_l522_l515_l508_l500_l518_DUPLICATE_078f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l518_DUPLICATE_14c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2c1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_2d31_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_f3bc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_d893_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l511_l522_l515_l525_l508_l500_l518_DUPLICATE_c2b3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_MUX_uxn_opcodes_h_l536_c16_3329_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_value := VAR_MUX_uxn_opcodes_h_l536_c16_3329_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l550_c4_85f0;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_736b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output;

     -- t8_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l530_c32_29d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_left;
     BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output := BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- MUX[uxn_opcodes_h_l535_c16_4449] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l535_c16_4449_cond <= VAR_MUX_uxn_opcodes_h_l535_c16_4449_cond;
     MUX_uxn_opcodes_h_l535_c16_4449_iftrue <= VAR_MUX_uxn_opcodes_h_l535_c16_4449_iftrue;
     MUX_uxn_opcodes_h_l535_c16_4449_iffalse <= VAR_MUX_uxn_opcodes_h_l535_c16_4449_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l535_c16_4449_return_output := MUX_uxn_opcodes_h_l535_c16_4449_return_output;

     -- l8_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l530_c32_29d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_MUX_uxn_opcodes_h_l535_c16_4449_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_device_address := VAR_MUX_uxn_opcodes_h_l535_c16_4449_return_output;
     VAR_printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_736b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     -- n8_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- l8_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- t8_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- printf_uxn_opcodes_h_l501_c3_1eaa[uxn_opcodes_h_l501_c3_1eaa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l501_c3_1eaa_uxn_opcodes_h_l501_c3_1eaa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l530_c32_9bc5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l530_c32_9bc5_cond <= VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_cond;
     MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue <= VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iftrue;
     MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse <= VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_return_output := MUX_uxn_opcodes_h_l530_c32_9bc5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue := VAR_MUX_uxn_opcodes_h_l530_c32_9bc5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     -- l8_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- n8_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_l8_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- n8_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- l8_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- l8_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- l8_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_05a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output;

     -- l8_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_05a3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- device_out[uxn_opcodes_h_l537_c23_96f8] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l537_c23_96f8_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l537_c23_96f8_device_address <= VAR_device_out_uxn_opcodes_h_l537_c23_96f8_device_address;
     device_out_uxn_opcodes_h_l537_c23_96f8_value <= VAR_device_out_uxn_opcodes_h_l537_c23_96f8_value;
     device_out_uxn_opcodes_h_l537_c23_96f8_phase <= VAR_device_out_uxn_opcodes_h_l537_c23_96f8_phase;
     device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_96f8_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output := device_out_uxn_opcodes_h_l537_c23_96f8_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l543_c25_1fd5] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_1fd5_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l539_c31_f528] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_f528_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l542_c26_afb4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_afb4_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l540_c31_6442] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_6442_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.device_ram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l544_c23_459e] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_459e_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l541_c29_fba7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_fba7_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.device_ram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l538_c32_fa1b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_fa1b_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_96f8_return_output.is_device_ram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l545_l546_DUPLICATE_d204_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l539_c31_f528_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_fa1b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_afb4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l544_c23_459e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l543_c25_1fd5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_c31_6442_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l541_c29_fba7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l546_c3_8bf9] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output := current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l546_c3_8bf9] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_cond;
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output := is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l545_c24_39ae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_left;
     BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output := BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l545_c24_39ae_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l546_c3_8bf9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c7_a4d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c7_a4d1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l522_c7_1ef6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c7_1ef6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l518_c7_f82e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output := is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l518_c7_f82e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l515_c7_f9da] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_cond;
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output := is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l515_c7_f9da_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l511_c7_97b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l511_c7_97b5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l508_c7_a0a1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output := is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c7_a0a1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l500_c2_23d9] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_cond;
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output := is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l500_c2_23d9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l554_l493_DUPLICATE_adc6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l554_l493_DUPLICATE_adc6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c2_23d9_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c2_23d9_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l554_l493_DUPLICATE_adc6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l554_l493_DUPLICATE_adc6_return_output;
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
