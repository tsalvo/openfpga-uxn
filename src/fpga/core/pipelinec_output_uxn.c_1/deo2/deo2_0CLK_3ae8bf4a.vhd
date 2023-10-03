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
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l452_c6_29ae]
signal BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l452_c1_1d82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l460_c7_6448]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l452_c2_cc99]
signal t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l452_c2_cc99]
signal n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l452_c2_cc99]
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l452_c2_cc99]
signal is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l452_c2_cc99]
signal current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l452_c2_cc99]
signal deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l452_c2_cc99]
signal l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l452_c2_cc99]
signal deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l452_c2_cc99]
signal device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l453_c3_22f1[uxn_opcodes_h_l453_c3_22f1]
signal printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l460_c11_a9d5]
signal BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l463_c7_1544]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l460_c7_6448]
signal t8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l460_c7_6448]
signal n8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l460_c7_6448]
signal result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l460_c7_6448]
signal is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l460_c7_6448]
signal current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l460_c7_6448]
signal deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l460_c7_6448]
signal l8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l460_c7_6448]
signal deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l460_c7_6448]
signal device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l463_c11_a232]
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_80c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l463_c7_1544]
signal t8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l463_c7_1544]
signal n8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l463_c7_1544]
signal result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l463_c7_1544]
signal is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l463_c7_1544]
signal current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l463_c7_1544]
signal deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l463_c7_1544]
signal l8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l463_c7_1544]
signal deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l463_c7_1544]
signal device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_9d7c]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_844e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l467_c7_80c1]
signal n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_80c1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l467_c7_80c1]
signal is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l467_c7_80c1]
signal current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l467_c7_80c1]
signal deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l467_c7_80c1]
signal l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l467_c7_80c1]
signal deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l467_c7_80c1]
signal device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l470_c11_70b0]
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_7d77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l470_c7_844e]
signal n8_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_844e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l470_c7_844e]
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l470_c7_844e]
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l470_c7_844e]
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l470_c7_844e]
signal l8_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l470_c7_844e]
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l470_c7_844e]
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l474_c11_c7da]
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_bf45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_7d77]
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l474_c7_7d77]
signal is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l474_c7_7d77]
signal current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l474_c7_7d77]
signal deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l474_c7_7d77]
signal l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l474_c7_7d77]
signal deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l474_c7_7d77]
signal device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_5006]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l484_c1_c980]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_bf45]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l477_c7_bf45]
signal is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l477_c7_bf45]
signal current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l477_c7_bf45]
signal deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l477_c7_bf45]
signal l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l477_c7_bf45]
signal deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l477_c7_bf45]
signal device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l482_c32_da9c]
signal BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l482_c32_e33c]
signal BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l482_c32_4c1a]
signal MUX_uxn_opcodes_h_l482_c32_4c1a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l482_c32_4c1a_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l487_c32_27fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l487_c16_b3a2]
signal MUX_uxn_opcodes_h_l487_c16_b3a2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c16_b3a2_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l488_c16_183d]
signal MUX_uxn_opcodes_h_l488_c16_183d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l488_c16_183d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l488_c16_183d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l488_c16_183d_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l489_c23_a9c2]
signal device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l489_c23_a9c2_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l489_c23_a9c2_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l489_c23_a9c2_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l489_c23_a9c2_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l497_c24_2005]
signal BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l498_c3_14d3]
signal is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l498_c3_14d3]
signal current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l502_c4_bc29]
signal BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d102( ref_toks_0 : opcode_result_t;
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
      base.is_device_ram_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.vram_value := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.vram_address := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.device_ram_value := ref_toks_11;
      base.device_ram_address := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae
BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left,
BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right,
BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- t8_MUX_uxn_opcodes_h_l452_c2_cc99
t8_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- n8_MUX_uxn_opcodes_h_l452_c2_cc99
n8_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99
result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99
result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99
result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99
result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99
result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99
result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99
is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99
current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99
deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- l8_MUX_uxn_opcodes_h_l452_c2_cc99
l8_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99
deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99
device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond,
device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue,
device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse,
device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

-- printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1
printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1 : entity work.printf_uxn_opcodes_h_l453_c3_22f1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5
BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left,
BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right,
BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- t8_MUX_uxn_opcodes_h_l460_c7_6448
t8_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l460_c7_6448_cond,
t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- n8_MUX_uxn_opcodes_h_l460_c7_6448
n8_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l460_c7_6448_cond,
n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448
result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448
result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448
result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448
result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448
result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448
result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448
result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448
result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448
result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448
result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448
result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448
is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond,
is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448
current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond,
current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l460_c7_6448
deo_param0_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond,
deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- l8_MUX_uxn_opcodes_h_l460_c7_6448
l8_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l460_c7_6448_cond,
l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l460_c7_6448
deo_param1_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond,
deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l460_c7_6448
device_out_result_MUX_uxn_opcodes_h_l460_c7_6448 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond,
device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue,
device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse,
device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232
BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- t8_MUX_uxn_opcodes_h_l463_c7_1544
t8_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l463_c7_1544_cond,
t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- n8_MUX_uxn_opcodes_h_l463_c7_1544
n8_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l463_c7_1544_cond,
n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544
result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544
result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544
result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544
result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544
result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544
result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544
result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544
result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544
result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544
result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544
is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond,
is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544
current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond,
current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l463_c7_1544
deo_param0_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond,
deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- l8_MUX_uxn_opcodes_h_l463_c7_1544
l8_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l463_c7_1544_cond,
l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l463_c7_1544
deo_param1_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond,
deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l463_c7_1544
device_out_result_MUX_uxn_opcodes_h_l463_c7_1544 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond,
device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue,
device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse,
device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- n8_MUX_uxn_opcodes_h_l467_c7_80c1
n8_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1
result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1
result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1
result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1
is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1
current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1
deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- l8_MUX_uxn_opcodes_h_l467_c7_80c1
l8_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1
deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1
device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond,
device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0
BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- n8_MUX_uxn_opcodes_h_l470_c7_844e
n8_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l470_c7_844e_cond,
n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e
result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e
result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e
result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e
is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l470_c7_844e
deo_param0_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond,
deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- l8_MUX_uxn_opcodes_h_l470_c7_844e
l8_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l470_c7_844e_cond,
l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l470_c7_844e
deo_param1_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond,
deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l470_c7_844e
device_out_result_MUX_uxn_opcodes_h_l470_c7_844e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond,
device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da
BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77
result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77
result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77
result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77
is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77
current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77
deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- l8_MUX_uxn_opcodes_h_l474_c7_7d77
l8_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77
deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77
device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond,
device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue,
device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse,
device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006
BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45
result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45
result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45
result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45
is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45
current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45
deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- l8_MUX_uxn_opcodes_h_l477_c7_bf45
l8_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45
deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45
device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond,
device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue,
device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse,
device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c
BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left,
BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right,
BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c
BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left,
BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right,
BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output);

-- MUX_uxn_opcodes_h_l482_c32_4c1a
MUX_uxn_opcodes_h_l482_c32_4c1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l482_c32_4c1a_cond,
MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue,
MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse,
MUX_uxn_opcodes_h_l482_c32_4c1a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa
BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output);

-- MUX_uxn_opcodes_h_l487_c16_b3a2
MUX_uxn_opcodes_h_l487_c16_b3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c16_b3a2_cond,
MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue,
MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse,
MUX_uxn_opcodes_h_l487_c16_b3a2_return_output);

-- MUX_uxn_opcodes_h_l488_c16_183d
MUX_uxn_opcodes_h_l488_c16_183d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l488_c16_183d_cond,
MUX_uxn_opcodes_h_l488_c16_183d_iftrue,
MUX_uxn_opcodes_h_l488_c16_183d_iffalse,
MUX_uxn_opcodes_h_l488_c16_183d_return_output);

-- device_out_uxn_opcodes_h_l489_c23_a9c2
device_out_uxn_opcodes_h_l489_c23_a9c2 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l489_c23_a9c2_device_address,
device_out_uxn_opcodes_h_l489_c23_a9c2_value,
device_out_uxn_opcodes_h_l489_c23_a9c2_phase,
device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read,
device_out_uxn_opcodes_h_l489_c23_a9c2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l497_c24_2005
BIN_OP_AND_uxn_opcodes_h_l497_c24_2005 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left,
BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right,
BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3
is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond,
is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3
current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond,
current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29
BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left,
BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right,
BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
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
 BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output,
 MUX_uxn_opcodes_h_l482_c32_4c1a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output,
 MUX_uxn_opcodes_h_l487_c16_b3a2_return_output,
 MUX_uxn_opcodes_h_l488_c16_183d_return_output,
 device_out_uxn_opcodes_h_l489_c23_a9c2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_0b28 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l458_c3_f7bc : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l461_c3_a264 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_cf5f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l468_c3_8afb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_ca16 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_9298 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l486_c3_c8b3 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_2daa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_c7_bf45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l488_c16_183d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l488_c16_183d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l488_c16_183d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l488_c16_183d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l490_c32_e4e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l491_c31_5b16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c31_9aae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l493_c29_c042_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l494_c26_a695_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l495_c25_ac8a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l496_c23_40da_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l499_c4_14a2 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l502_c4_80fa : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l506_l445_DUPLICATE_0f89_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right := to_unsigned(3, 2);
     VAR_current_deo_phase_uxn_opcodes_h_l499_c4_14a2 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l499_c4_14a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l468_c3_8afb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l468_c3_8afb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_0b28 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_0b28;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse := resize(to_signed(-3, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_9298 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_9298;
     VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_current_deo_phase_uxn_opcodes_h_l458_c3_f7bc := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l458_c3_f7bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l461_c3_a264 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l461_c3_a264;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l486_c3_c8b3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l486_c3_c8b3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_2daa := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_2daa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_ca16 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_ca16;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_cf5f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_cf5f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l488_c16_183d_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l488_c16_183d_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l488_c16_183d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left := t8;
     VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l460_c11_a9d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l487_c32_27fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output := result.device_ram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_c7_bf45_return_output := result.stack_address_sp_offset;

     -- MUX[uxn_opcodes_h_l488_c16_183d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l488_c16_183d_cond <= VAR_MUX_uxn_opcodes_h_l488_c16_183d_cond;
     MUX_uxn_opcodes_h_l488_c16_183d_iftrue <= VAR_MUX_uxn_opcodes_h_l488_c16_183d_iftrue;
     MUX_uxn_opcodes_h_l488_c16_183d_iffalse <= VAR_MUX_uxn_opcodes_h_l488_c16_183d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l488_c16_183d_return_output := MUX_uxn_opcodes_h_l488_c16_183d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c32_da9c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output := result.device_ram_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_5006] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l470_c11_70b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output := result.is_device_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l502_c4_bc29] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_left;
     BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output := BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_9d7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l463_c11_a232] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_left;
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output := BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l452_c6_29ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l474_c11_c7da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_left;
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output := BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c32_da9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l452_c6_29ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l460_c11_a9d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_a232_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9d7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_70b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_c7da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_5006_return_output;
     VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c32_27fa_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l502_c4_80fa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l502_c4_bc29_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_a1aa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_4534_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_7600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_1727_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l463_l460_l452_l474_l470_l467_DUPLICATE_7e1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l463_l460_l477_l474_l470_l467_DUPLICATE_6900_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_5a38_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_c9bf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_1f7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_64b2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l463_l460_l452_l477_l474_l470_l467_DUPLICATE_66ca_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_MUX_uxn_opcodes_h_l488_c16_183d_return_output;
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_value := VAR_MUX_uxn_opcodes_h_l488_c16_183d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l502_c4_80fa;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- MUX[uxn_opcodes_h_l487_c16_b3a2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c16_b3a2_cond <= VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_cond;
     MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iftrue;
     MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_return_output := MUX_uxn_opcodes_h_l487_c16_b3a2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l482_c32_e33c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_left;
     BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output := BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l452_c1_1d82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output;

     -- t8_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output := t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- n8_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output := n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- l8_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l482_c32_e33c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_return_output;
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_device_address := VAR_MUX_uxn_opcodes_h_l487_c16_b3a2_return_output;
     VAR_printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_1d82_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_l8_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_t8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     -- printf_uxn_opcodes_h_l453_c3_22f1[uxn_opcodes_h_l453_c3_22f1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l453_c3_22f1_uxn_opcodes_h_l453_c3_22f1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l482_c32_4c1a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l482_c32_4c1a_cond <= VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_cond;
     MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue <= VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iftrue;
     MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse <= VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_return_output := MUX_uxn_opcodes_h_l482_c32_4c1a_return_output;

     -- l8_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- t8_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output := t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- n8_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue := VAR_MUX_uxn_opcodes_h_l482_c32_4c1a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_n8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_t8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output := deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- t8_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- n8_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output := n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- l8_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output := l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_n8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- l8_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output := deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- n8_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output := n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_l8_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_n8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     -- l8_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output := l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- n8_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output := deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_l8_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- l8_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output := l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output := deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output := deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_l8_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l484_c1_c980] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- l8_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output := deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c1_c980_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- device_out[uxn_opcodes_h_l489_c23_a9c2] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l489_c23_a9c2_device_address <= VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_device_address;
     device_out_uxn_opcodes_h_l489_c23_a9c2_value <= VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_value;
     device_out_uxn_opcodes_h_l489_c23_a9c2_phase <= VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_phase;
     device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output := device_out_uxn_opcodes_h_l489_c23_a9c2_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l493_c29_c042] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l493_c29_c042_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l495_c25_ac8a] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l495_c25_ac8a_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l491_c31_5b16] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l491_c31_5b16_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l496_c23_40da] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l496_c23_40da_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l490_c32_e4e0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l490_c32_e4e0_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.is_device_ram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l492_c31_9aae] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c31_9aae_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l494_c26_a695] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l494_c26_a695_return_output := VAR_device_out_uxn_opcodes_h_l489_c23_a9c2_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l498_l497_DUPLICATE_227d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l491_c31_5b16_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l490_c32_e4e0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l494_c26_a695_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l496_c23_40da_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l495_c25_ac8a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c31_9aae_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l493_c29_c042_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l498_c3_14d3] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output := current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l498_c3_14d3] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_cond;
     is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output := is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l497_c24_2005] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_left;
     BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output := BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l497_c24_2005_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l498_c3_14d3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l498_c3_14d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l477_c7_bf45] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_cond;
     is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output := is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output := device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_bf45_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l474_c7_7d77] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output := current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_7d77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output := device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output := is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l470_c7_844e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_844e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_80c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output := device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_80c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output := is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l463_c7_1544] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output := current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_1544_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output := is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l460_c7_6448] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output := current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l460_c7_6448_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l452_c2_cc99] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output := current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l452_c2_cc99_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l506_l445_DUPLICATE_0f89 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l506_l445_DUPLICATE_0f89_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d102(
     result,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l452_c2_cc99_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c2_cc99_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l506_l445_DUPLICATE_0f89_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l506_l445_DUPLICATE_0f89_return_output;
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
