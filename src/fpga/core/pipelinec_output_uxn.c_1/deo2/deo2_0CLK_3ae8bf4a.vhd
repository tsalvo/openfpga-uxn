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
-- BIN_OP_EQ[uxn_opcodes_h_l596_c6_6a09]
signal BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c1_f797]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c7_7783]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l596_c2_68f1]
signal deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l596_c2_68f1]
signal device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l596_c2_68f1]
signal t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l596_c2_68f1]
signal l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l596_c2_68f1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l596_c2_68f1]
signal current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l596_c2_68f1]
signal is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l596_c2_68f1]
signal n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l596_c2_68f1]
signal deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l597_c3_8b0a[uxn_opcodes_h_l597_c3_8b0a]
signal printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l604_c11_344b]
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l607_c7_1a20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l604_c7_7783]
signal deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l604_c7_7783]
signal device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l604_c7_7783]
signal t8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l604_c7_7783]
signal l8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l604_c7_7783]
signal result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l604_c7_7783]
signal current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l604_c7_7783]
signal is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l604_c7_7783]
signal n8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l604_c7_7783]
signal deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l607_c11_f7c6]
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l611_c7_f877]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l607_c7_1a20]
signal deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l607_c7_1a20]
signal device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l607_c7_1a20]
signal t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l607_c7_1a20]
signal l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l607_c7_1a20]
signal result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l607_c7_1a20]
signal current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l607_c7_1a20]
signal is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l607_c7_1a20]
signal n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l607_c7_1a20]
signal deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l611_c11_5d86]
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l611_c7_f877]
signal deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l611_c7_f877]
signal device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l611_c7_f877]
signal l8_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l611_c7_f877]
signal result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l611_c7_f877]
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l611_c7_f877]
signal is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l611_c7_f877]
signal n8_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l611_c7_f877]
signal deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l614_c11_f327]
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_d931]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l614_c7_1f2a]
signal deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l618_c11_9344]
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_74d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l618_c7_d931]
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l618_c7_d931]
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l618_c7_d931]
signal l8_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l618_c7_d931]
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l618_c7_d931]
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l618_c7_d931]
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l618_c7_d931]
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_9659]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c1_52f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l621_c7_74d4]
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l621_c7_74d4]
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l621_c7_74d4]
signal l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l621_c7_74d4]
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l621_c7_74d4]
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l621_c7_74d4]
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l621_c7_74d4]
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l626_c32_27db]
signal BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l626_c32_f5f1]
signal BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l626_c32_fae5]
signal MUX_uxn_opcodes_h_l626_c32_fae5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l626_c32_fae5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l626_c32_fae5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l626_c32_fae5_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l630_c32_b468]
signal BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l630_c16_915a]
signal MUX_uxn_opcodes_h_l630_c16_915a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l630_c16_915a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l630_c16_915a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l630_c16_915a_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l631_c16_e0d5]
signal MUX_uxn_opcodes_h_l631_c16_e0d5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l631_c16_e0d5_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l632_c23_1644]
signal device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l632_c23_1644_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l632_c23_1644_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l632_c23_1644_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l632_c23_1644_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l640_c24_8b64]
signal BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l641_c3_8679]
signal current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l641_c3_8679]
signal is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l645_c4_0ea4]
signal BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.vram_value := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;
      base.is_device_ram_read := ref_toks_11;
      base.device_ram_value := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09
BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left,
BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right,
BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1
deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1
device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- t8_MUX_uxn_opcodes_h_l596_c2_68f1
t8_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- l8_MUX_uxn_opcodes_h_l596_c2_68f1
l8_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1
result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1
result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1
result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1
result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1
result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1
current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1
is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- n8_MUX_uxn_opcodes_h_l596_c2_68f1
n8_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1
deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond,
deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

-- printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a
printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a : entity work.printf_uxn_opcodes_h_l597_c3_8b0a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b
BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left,
BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right,
BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l604_c7_7783
deo_param1_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond,
deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l604_c7_7783
device_out_result_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond,
device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- t8_MUX_uxn_opcodes_h_l604_c7_7783
t8_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l604_c7_7783_cond,
t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- l8_MUX_uxn_opcodes_h_l604_c7_7783
l8_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l604_c7_7783_cond,
l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783
result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783
result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783
result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783
result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783
result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783
result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783
result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783
result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783
result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783
result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783
result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783
current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond,
current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783
is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond,
is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- n8_MUX_uxn_opcodes_h_l604_c7_7783
n8_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l604_c7_7783_cond,
n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l604_c7_7783
deo_param0_MUX_uxn_opcodes_h_l604_c7_7783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond,
deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue,
deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse,
deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6
BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20
deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20
device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- t8_MUX_uxn_opcodes_h_l607_c7_1a20
t8_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- l8_MUX_uxn_opcodes_h_l607_c7_1a20
l8_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20
result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20
result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20
result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20
result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20
result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20
current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20
is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- n8_MUX_uxn_opcodes_h_l607_c7_1a20
n8_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20
deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond,
deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue,
deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse,
deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left,
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right,
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l611_c7_f877
deo_param1_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond,
deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l611_c7_f877
device_out_result_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond,
device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- l8_MUX_uxn_opcodes_h_l611_c7_f877
l8_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l611_c7_f877_cond,
l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877
result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877
result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877
result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877
result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877
result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877
result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877
result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877
result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877
result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877
result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877
result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877
current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond,
current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877
is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond,
is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- n8_MUX_uxn_opcodes_h_l611_c7_f877
n8_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l611_c7_f877_cond,
n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l611_c7_f877
deo_param0_MUX_uxn_opcodes_h_l611_c7_f877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond,
deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue,
deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse,
deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327
BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a
deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a
device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- l8_MUX_uxn_opcodes_h_l614_c7_1f2a
l8_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a
result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a
result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a
result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a
result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a
result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a
current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a
is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- n8_MUX_uxn_opcodes_h_l614_c7_1f2a
n8_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a
deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond,
deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344
BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l618_c7_d931
deo_param1_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond,
deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l618_c7_d931
device_out_result_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond,
device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- l8_MUX_uxn_opcodes_h_l618_c7_d931
l8_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l618_c7_d931_cond,
l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931
result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931
result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931
is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l618_c7_d931
deo_param0_MUX_uxn_opcodes_h_l618_c7_d931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond,
deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue,
deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse,
deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659
BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4
deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4
device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- l8_MUX_uxn_opcodes_h_l621_c7_74d4
l8_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4
result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4
result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4
is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4
deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond,
deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l626_c32_27db
BIN_OP_AND_uxn_opcodes_h_l626_c32_27db : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left,
BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right,
BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1
BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left,
BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right,
BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output);

-- MUX_uxn_opcodes_h_l626_c32_fae5
MUX_uxn_opcodes_h_l626_c32_fae5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l626_c32_fae5_cond,
MUX_uxn_opcodes_h_l626_c32_fae5_iftrue,
MUX_uxn_opcodes_h_l626_c32_fae5_iffalse,
MUX_uxn_opcodes_h_l626_c32_fae5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468
BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left,
BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right,
BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output);

-- MUX_uxn_opcodes_h_l630_c16_915a
MUX_uxn_opcodes_h_l630_c16_915a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l630_c16_915a_cond,
MUX_uxn_opcodes_h_l630_c16_915a_iftrue,
MUX_uxn_opcodes_h_l630_c16_915a_iffalse,
MUX_uxn_opcodes_h_l630_c16_915a_return_output);

-- MUX_uxn_opcodes_h_l631_c16_e0d5
MUX_uxn_opcodes_h_l631_c16_e0d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l631_c16_e0d5_cond,
MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue,
MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse,
MUX_uxn_opcodes_h_l631_c16_e0d5_return_output);

-- device_out_uxn_opcodes_h_l632_c23_1644
device_out_uxn_opcodes_h_l632_c23_1644 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l632_c23_1644_device_address,
device_out_uxn_opcodes_h_l632_c23_1644_value,
device_out_uxn_opcodes_h_l632_c23_1644_phase,
device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read,
device_out_uxn_opcodes_h_l632_c23_1644_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64
BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left,
BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right,
BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679
current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond,
current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679
is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond,
is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4
BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left,
BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right,
BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output,
 BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output,
 MUX_uxn_opcodes_h_l626_c32_fae5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output,
 MUX_uxn_opcodes_h_l630_c16_915a_return_output,
 MUX_uxn_opcodes_h_l631_c16_e0d5_return_output,
 device_out_uxn_opcodes_h_l632_c23_1644_return_output,
 BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l599_c3_d71a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l602_c3_8efe : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l609_c3_f908 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_17ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l616_c3_d45e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_e1d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_f747 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l621_c7_74d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l626_c32_fae5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l626_c32_fae5_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l630_c16_915a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l630_c16_915a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l630_c16_915a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l630_c16_915a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l633_c32_9c59_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l634_c31_8e55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l635_c31_8504_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l636_c29_8472_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l637_c26_94da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l638_c25_215e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l639_c23_2fe0_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l642_c4_3935 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l645_c4_6e92 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb_uxn_opcodes_h_l589_l649_DUPLICATE_9b09_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l616_c3_d45e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l616_c3_d45e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_e1d2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l619_c3_e1d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_f747 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_f747;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l602_c3_8efe := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l602_c3_8efe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l599_c3_d71a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l599_c3_d71a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l642_c4_3935 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l642_c4_3935;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_17ed := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_17ed;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l609_c3_f908 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l609_c3_f908;
     VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed0a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed0a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l630_c16_915a_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left := t8;
     VAR_MUX_uxn_opcodes_h_l630_c16_915a_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := t8;
     -- MUX[uxn_opcodes_h_l631_c16_e0d5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l631_c16_e0d5_cond <= VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_cond;
     MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue <= VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iftrue;
     MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse <= VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_return_output := MUX_uxn_opcodes_h_l631_c16_e0d5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l630_c32_b468] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_left;
     BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output := BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l611_c11_5d86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_left;
     BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output := BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l618_c11_9344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_left;
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output := BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l614_c11_f327] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_left;
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output := BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output := result.is_vram_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_9659] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l621_c7_74d4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l596_c6_6a09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_left;
     BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output := BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l604_c11_344b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_left;
     BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output := BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output := result.vram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l626_c32_27db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_left;
     BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output := BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l607_c11_f7c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l645_c4_0ea4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l626_c32_27db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c6_6a09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_344b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_f7c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5d86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_f327_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_9344_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_9659_return_output;
     VAR_MUX_uxn_opcodes_h_l630_c16_915a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l630_c32_b468_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l645_c4_6e92 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l645_c4_0ea4_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_3672_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_91c5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_93c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_f871_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l604_l596_l618_l614_l611_l607_DUPLICATE_6817_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l604_l621_l618_l614_l611_l607_DUPLICATE_705c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_9ceb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_1f69_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_14a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_5294_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_l596_l621_l618_l614_l611_l607_DUPLICATE_b06c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_return_output;
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_value := VAR_MUX_uxn_opcodes_h_l631_c16_e0d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l645_c4_6e92;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- MUX[uxn_opcodes_h_l630_c16_915a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l630_c16_915a_cond <= VAR_MUX_uxn_opcodes_h_l630_c16_915a_cond;
     MUX_uxn_opcodes_h_l630_c16_915a_iftrue <= VAR_MUX_uxn_opcodes_h_l630_c16_915a_iftrue;
     MUX_uxn_opcodes_h_l630_c16_915a_iffalse <= VAR_MUX_uxn_opcodes_h_l630_c16_915a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l630_c16_915a_return_output := MUX_uxn_opcodes_h_l630_c16_915a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- n8_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- l8_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c1_f797] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l626_c32_f5f1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_left;
     BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output := BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l626_c32_fae5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l626_c32_f5f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_MUX_uxn_opcodes_h_l630_c16_915a_return_output;
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_device_address := VAR_MUX_uxn_opcodes_h_l630_c16_915a_return_output;
     VAR_printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_f797_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_l8_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_n8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_t8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- l8_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output := l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- MUX[uxn_opcodes_h_l626_c32_fae5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l626_c32_fae5_cond <= VAR_MUX_uxn_opcodes_h_l626_c32_fae5_cond;
     MUX_uxn_opcodes_h_l626_c32_fae5_iftrue <= VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iftrue;
     MUX_uxn_opcodes_h_l626_c32_fae5_iffalse <= VAR_MUX_uxn_opcodes_h_l626_c32_fae5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l626_c32_fae5_return_output := MUX_uxn_opcodes_h_l626_c32_fae5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- printf_uxn_opcodes_h_l597_c3_8b0a[uxn_opcodes_h_l597_c3_8b0a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l597_c3_8b0a_uxn_opcodes_h_l597_c3_8b0a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output := n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output := deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- t8_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output := t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue := VAR_MUX_uxn_opcodes_h_l626_c32_fae5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_n8_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- n8_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output := deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- t8_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- l8_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_l8_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_n8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     -- n8_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output := n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output := deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- l8_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output := l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_l8_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     -- l8_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output := deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- n8_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_l8_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output := deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- l8_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output := l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c1_52f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- l8_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output := deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_52f5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- device_out[uxn_opcodes_h_l632_c23_1644] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l632_c23_1644_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l632_c23_1644_device_address <= VAR_device_out_uxn_opcodes_h_l632_c23_1644_device_address;
     device_out_uxn_opcodes_h_l632_c23_1644_value <= VAR_device_out_uxn_opcodes_h_l632_c23_1644_value;
     device_out_uxn_opcodes_h_l632_c23_1644_phase <= VAR_device_out_uxn_opcodes_h_l632_c23_1644_phase;
     device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l632_c23_1644_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output := device_out_uxn_opcodes_h_l632_c23_1644_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l636_c29_8472] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l636_c29_8472_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.device_ram_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l638_c25_215e] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l638_c25_215e_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l634_c31_8e55] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l634_c31_8e55_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l637_c26_94da] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l637_c26_94da_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.is_vram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l639_c23_2fe0] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l639_c23_2fe0_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.vram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l633_c32_9c59] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l633_c32_9c59_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.is_device_ram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l635_c31_8504] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l635_c31_8504_return_output := VAR_device_out_uxn_opcodes_h_l632_c23_1644_return_output.device_ram_address;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l640_l641_DUPLICATE_24e2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l634_c31_8e55_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l633_c32_9c59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l637_c26_94da_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l639_c23_2fe0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l638_c25_215e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l635_c31_8504_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l636_c29_8472_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l641_c3_8679] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_cond;
     is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output := is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output := device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l641_c3_8679] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output := current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l640_c24_8b64] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_left;
     BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output := BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l640_c24_8b64_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l641_c3_8679_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l641_c3_8679_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l621_c7_74d4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output := is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_74d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output := current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output := is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output := device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l618_c7_d931] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l618_c7_d931_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l614_c7_1f2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_1f2a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output := is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output := current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l611_c7_f877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output := device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l611_c7_f877_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_1a20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_1a20_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output := is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l604_c7_7783] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output := current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l604_c7_7783_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l596_c2_68f1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output := is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l596_c2_68f1_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb_uxn_opcodes_h_l589_l649_DUPLICATE_9b09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb_uxn_opcodes_h_l589_l649_DUPLICATE_9b09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l596_c2_68f1_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l596_c2_68f1_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb_uxn_opcodes_h_l589_l649_DUPLICATE_9b09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6aeb_uxn_opcodes_h_l589_l649_DUPLICATE_9b09_return_output;
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
