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
-- BIN_OP_EQ[uxn_opcodes_h_l610_c6_3b7b]
signal BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l610_c1_45ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l610_c2_5cf6]
signal current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l611_c3_5b91[uxn_opcodes_h_l611_c3_5b91]
signal printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l618_c11_e8ef]
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_f24f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l618_c7_dfc3]
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_2197]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c7_98da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l621_c7_f24f]
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l621_c7_f24f]
signal n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l621_c7_f24f]
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l621_c7_f24f]
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l621_c7_f24f]
signal l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l621_c7_f24f]
signal t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l621_c7_f24f]
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_f24f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l621_c7_f24f]
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l625_c11_a4b0]
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c7_c78b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l625_c7_98da]
signal is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l625_c7_98da]
signal n8_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l625_c7_98da]
signal device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l625_c7_98da]
signal deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l625_c7_98da]
signal l8_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l625_c7_98da]
signal deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l625_c7_98da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l625_c7_98da]
signal current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l628_c11_35bb]
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l632_c7_3a86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l628_c7_c78b]
signal is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l628_c7_c78b]
signal n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l628_c7_c78b]
signal device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l628_c7_c78b]
signal deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l628_c7_c78b]
signal l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l628_c7_c78b]
signal deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l628_c7_c78b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l628_c7_c78b]
signal current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l632_c11_cc75]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l635_c7_638f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l632_c7_3a86]
signal is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l632_c7_3a86]
signal device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l632_c7_3a86]
signal deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l632_c7_3a86]
signal l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l632_c7_3a86]
signal deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l632_c7_3a86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l632_c7_3a86]
signal current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l635_c11_c876]
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l642_c1_58fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l635_c7_638f]
signal is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l635_c7_638f]
signal device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l635_c7_638f]
signal deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l635_c7_638f]
signal l8_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l635_c7_638f]
signal deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l635_c7_638f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l635_c7_638f]
signal current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l640_c32_2a19]
signal BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l640_c32_ae76]
signal BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l640_c32_03bc]
signal MUX_uxn_opcodes_h_l640_c32_03bc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l640_c32_03bc_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l640_c32_03bc_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l640_c32_03bc_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l644_c32_84ff]
signal BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l644_c16_0198]
signal MUX_uxn_opcodes_h_l644_c16_0198_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l644_c16_0198_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l644_c16_0198_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l644_c16_0198_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l645_c16_63ca]
signal MUX_uxn_opcodes_h_l645_c16_63ca_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l645_c16_63ca_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l645_c16_63ca_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l645_c16_63ca_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l646_c23_e2da]
signal device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l646_c23_e2da_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l646_c23_e2da_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l646_c23_e2da_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l646_c23_e2da_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l654_c24_8b41]
signal BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l655_c3_9d27]
signal is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l655_c3_9d27]
signal current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l659_c4_8248]
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.device_ram_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.is_device_ram_write := ref_toks_11;
      base.is_stack_read := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b
BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left,
BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right,
BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6
is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- n8_MUX_uxn_opcodes_h_l610_c2_5cf6
n8_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6
device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6
deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- l8_MUX_uxn_opcodes_h_l610_c2_5cf6
l8_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- t8_MUX_uxn_opcodes_h_l610_c2_5cf6
t8_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6
deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6
result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6
result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6
result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6
result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6
result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6
current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

-- printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91
printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91 : entity work.printf_uxn_opcodes_h_l611_c3_5b91_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef
BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3
is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- n8_MUX_uxn_opcodes_h_l618_c7_dfc3
n8_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3
device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3
deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- l8_MUX_uxn_opcodes_h_l618_c7_dfc3
l8_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- t8_MUX_uxn_opcodes_h_l618_c7_dfc3
t8_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3
deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3
result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3
result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197
BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f
is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- n8_MUX_uxn_opcodes_h_l621_c7_f24f
n8_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f
device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f
deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- l8_MUX_uxn_opcodes_h_l621_c7_f24f
l8_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- t8_MUX_uxn_opcodes_h_l621_c7_f24f
t8_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f
deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f
result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f
result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0
BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left,
BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right,
BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da
is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond,
is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- n8_MUX_uxn_opcodes_h_l625_c7_98da
n8_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l625_c7_98da_cond,
n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l625_c7_98da
device_out_result_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond,
device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l625_c7_98da
deo_param1_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond,
deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- l8_MUX_uxn_opcodes_h_l625_c7_98da
l8_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l625_c7_98da_cond,
l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l625_c7_98da
deo_param0_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond,
deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da
result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da
result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da
result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da
result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da
result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da
result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da
result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da
result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da
result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da
result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da
result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da
current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond,
current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb
BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left,
BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right,
BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b
is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- n8_MUX_uxn_opcodes_h_l628_c7_c78b
n8_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b
device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b
deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- l8_MUX_uxn_opcodes_h_l628_c7_c78b
l8_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b
deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b
result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b
result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b
result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b
result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b
result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b
current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75
BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86
is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86
device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86
deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- l8_MUX_uxn_opcodes_h_l632_c7_3a86
l8_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86
deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86
result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86
result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86
result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86
result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86
current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond,
current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876
BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left,
BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right,
BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f
is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond,
is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l635_c7_638f
device_out_result_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond,
device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l635_c7_638f
deo_param1_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond,
deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- l8_MUX_uxn_opcodes_h_l635_c7_638f
l8_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l635_c7_638f_cond,
l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l635_c7_638f
deo_param0_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond,
deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f
result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f
result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f
result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f
result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f
result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f
result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f
result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f
result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f
result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f
result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f
result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f
current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19
BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left,
BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right,
BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76
BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left,
BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right,
BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output);

-- MUX_uxn_opcodes_h_l640_c32_03bc
MUX_uxn_opcodes_h_l640_c32_03bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l640_c32_03bc_cond,
MUX_uxn_opcodes_h_l640_c32_03bc_iftrue,
MUX_uxn_opcodes_h_l640_c32_03bc_iffalse,
MUX_uxn_opcodes_h_l640_c32_03bc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff
BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left,
BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right,
BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output);

-- MUX_uxn_opcodes_h_l644_c16_0198
MUX_uxn_opcodes_h_l644_c16_0198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l644_c16_0198_cond,
MUX_uxn_opcodes_h_l644_c16_0198_iftrue,
MUX_uxn_opcodes_h_l644_c16_0198_iffalse,
MUX_uxn_opcodes_h_l644_c16_0198_return_output);

-- MUX_uxn_opcodes_h_l645_c16_63ca
MUX_uxn_opcodes_h_l645_c16_63ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l645_c16_63ca_cond,
MUX_uxn_opcodes_h_l645_c16_63ca_iftrue,
MUX_uxn_opcodes_h_l645_c16_63ca_iffalse,
MUX_uxn_opcodes_h_l645_c16_63ca_return_output);

-- device_out_uxn_opcodes_h_l646_c23_e2da
device_out_uxn_opcodes_h_l646_c23_e2da : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l646_c23_e2da_device_address,
device_out_uxn_opcodes_h_l646_c23_e2da_value,
device_out_uxn_opcodes_h_l646_c23_e2da_phase,
device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read,
device_out_uxn_opcodes_h_l646_c23_e2da_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41
BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left,
BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right,
BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27
is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond,
is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27
current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond,
current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248
BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left,
BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right,
BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output,
 BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output,
 MUX_uxn_opcodes_h_l640_c32_03bc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output,
 MUX_uxn_opcodes_h_l644_c16_0198_return_output,
 MUX_uxn_opcodes_h_l645_c16_63ca_return_output,
 device_out_uxn_opcodes_h_l646_c23_e2da_return_output,
 BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l613_c3_5e71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l616_c3_4754 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_bbe6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_879c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_72f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_9d4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_f97c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_42cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l635_c7_638f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l640_c32_03bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l640_c32_03bc_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l644_c16_0198_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l644_c16_0198_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l644_c16_0198_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l644_c16_0198_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l645_c16_63ca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l645_c16_63ca_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l647_c32_d04a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l648_c31_fb29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l649_c31_a2f2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l650_c29_582b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l651_c26_7a77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l652_c25_88be_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l653_c23_b28c_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l656_c4_973b : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l659_c4_ca8f : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6_uxn_opcodes_h_l663_l603_DUPLICATE_9be5_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l656_c4_973b := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l656_c4_973b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_f97c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_f97c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_879c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_879c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l613_c3_5e71 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l613_c3_5e71;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_9d4e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_9d4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_72f0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_72f0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_42cc := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_42cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iffalse := resize(to_signed(-3, 3), 8);
     VAR_current_deo_phase_uxn_opcodes_h_l616_c3_4754 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l616_c3_4754;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_bbe6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_bbe6;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l644_c16_0198_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l645_c16_63ca_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left := t8;
     VAR_MUX_uxn_opcodes_h_l644_c16_0198_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_2197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l610_c6_3b7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l625_c11_a4b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l640_c32_2a19] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_left;
     BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output := BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output := result.device_ram_value;

     -- MUX[uxn_opcodes_h_l645_c16_63ca] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l645_c16_63ca_cond <= VAR_MUX_uxn_opcodes_h_l645_c16_63ca_cond;
     MUX_uxn_opcodes_h_l645_c16_63ca_iftrue <= VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iftrue;
     MUX_uxn_opcodes_h_l645_c16_63ca_iffalse <= VAR_MUX_uxn_opcodes_h_l645_c16_63ca_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l645_c16_63ca_return_output := MUX_uxn_opcodes_h_l645_c16_63ca_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l635_c11_c876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_left;
     BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output := BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c11_cc75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output := result.device_ram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output := result.is_device_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l659_c4_8248] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_left;
     BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output := BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l628_c11_35bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l618_c11_e8ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l635_c7_638f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l644_c32_84ff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_left;
     BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output := BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left := VAR_BIN_OP_AND_uxn_opcodes_h_l640_c32_2a19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c6_3b7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_e8ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_2197_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_a4b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_35bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_cc75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_c876_return_output;
     VAR_MUX_uxn_opcodes_h_l644_c16_0198_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l644_c32_84ff_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l659_c4_ca8f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c4_8248_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e040_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_5739_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_3455_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_627d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_DUPLICATE_5b54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l635_DUPLICATE_3aef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_e1fc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_6ae6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9064_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_c5fb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l632_l628_l625_l621_l618_l610_l635_DUPLICATE_9cbd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_MUX_uxn_opcodes_h_l645_c16_63ca_return_output;
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_value := VAR_MUX_uxn_opcodes_h_l645_c16_63ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l659_c4_ca8f;
     -- t8_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- n8_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output := deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l640_c32_ae76] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_left;
     BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output := BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l610_c1_45ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output;

     -- l8_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output := l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- MUX[uxn_opcodes_h_l644_c16_0198] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l644_c16_0198_cond <= VAR_MUX_uxn_opcodes_h_l644_c16_0198_cond;
     MUX_uxn_opcodes_h_l644_c16_0198_iftrue <= VAR_MUX_uxn_opcodes_h_l644_c16_0198_iftrue;
     MUX_uxn_opcodes_h_l644_c16_0198_iffalse <= VAR_MUX_uxn_opcodes_h_l644_c16_0198_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l644_c16_0198_return_output := MUX_uxn_opcodes_h_l644_c16_0198_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l640_c32_03bc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l640_c32_ae76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_MUX_uxn_opcodes_h_l644_c16_0198_return_output;
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_device_address := VAR_MUX_uxn_opcodes_h_l644_c16_0198_return_output;
     VAR_printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c1_45ea_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_l8_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- MUX[uxn_opcodes_h_l640_c32_03bc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l640_c32_03bc_cond <= VAR_MUX_uxn_opcodes_h_l640_c32_03bc_cond;
     MUX_uxn_opcodes_h_l640_c32_03bc_iftrue <= VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iftrue;
     MUX_uxn_opcodes_h_l640_c32_03bc_iffalse <= VAR_MUX_uxn_opcodes_h_l640_c32_03bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l640_c32_03bc_return_output := MUX_uxn_opcodes_h_l640_c32_03bc_return_output;

     -- printf_uxn_opcodes_h_l611_c3_5b91[uxn_opcodes_h_l611_c3_5b91] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l611_c3_5b91_uxn_opcodes_h_l611_c3_5b91_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- n8_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output := n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- l8_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output := deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue := VAR_MUX_uxn_opcodes_h_l640_c32_03bc_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- n8_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- l8_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- t8_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_l8_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- l8_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output := l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output := deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- n8_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- n8_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output := deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- l8_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_l8_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- l8_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l642_c1_58fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- l8_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c1_58fe_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- device_out[uxn_opcodes_h_l646_c23_e2da] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l646_c23_e2da_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l646_c23_e2da_device_address <= VAR_device_out_uxn_opcodes_h_l646_c23_e2da_device_address;
     device_out_uxn_opcodes_h_l646_c23_e2da_value <= VAR_device_out_uxn_opcodes_h_l646_c23_e2da_value;
     device_out_uxn_opcodes_h_l646_c23_e2da_phase <= VAR_device_out_uxn_opcodes_h_l646_c23_e2da_phase;
     device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l646_c23_e2da_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output := device_out_uxn_opcodes_h_l646_c23_e2da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.is_deo_done;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l653_c23_b28c] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l653_c23_b28c_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l647_c32_d04a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l647_c32_d04a_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.is_device_ram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output := device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l649_c31_a2f2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l649_c31_a2f2_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l648_c31_fb29] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l648_c31_fb29_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l652_c25_88be] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l652_c25_88be_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l650_c29_582b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l650_c29_582b_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l651_c26_7a77] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l651_c26_7a77_return_output := VAR_device_out_uxn_opcodes_h_l646_c23_e2da_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l654_l655_DUPLICATE_1f4a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l648_c31_fb29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l647_c32_d04a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l651_c26_7a77_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l653_c23_b28c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l652_c25_88be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l649_c31_a2f2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l650_c29_582b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l655_c3_9d27] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_cond;
     is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output := is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l654_c24_8b41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_left;
     BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output := BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l655_c3_9d27] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output := current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l654_c24_8b41_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l655_c3_9d27_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l655_c3_9d27_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output := is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l635_c7_638f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l635_c7_638f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output := device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l632_c7_3a86] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output := current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3a86_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l628_c7_c78b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c7_c78b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output := is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output := current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l625_c7_98da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l625_c7_98da_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l621_c7_f24f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_f24f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l618_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_dfc3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l610_c2_5cf6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6_uxn_opcodes_h_l663_l603_DUPLICATE_9be5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6_uxn_opcodes_h_l663_l603_DUPLICATE_9be5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c2_5cf6_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6_uxn_opcodes_h_l663_l603_DUPLICATE_9be5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d7b6_uxn_opcodes_h_l663_l603_DUPLICATE_9be5_return_output;
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
