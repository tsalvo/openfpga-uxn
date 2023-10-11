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
-- Submodules: 148
entity deo2_0CLK_0c8ca612 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_0c8ca612;
architecture arch of deo2_0CLK_0c8ca612 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l567_c6_957a]
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l567_c1_72d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_e55d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l567_c2_0632]
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l567_c2_0632]
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l567_c2_0632]
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l567_c2_0632]
signal t8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c2_0632]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l567_c2_0632]
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l567_c2_0632]
signal n8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l567_c2_0632]
signal l8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l567_c2_0632]
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l568_c3_87e4[uxn_opcodes_h_l568_c3_87e4]
signal printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_264a]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_6d53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_e55d]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_e55d]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_e55d]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_e55d]
signal t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_e55d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_e55d]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_e55d]
signal n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_e55d]
signal l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_e55d]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l577_c11_2628]
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_0e50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l577_c7_6d53]
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l577_c7_6d53]
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_6d53]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l577_c7_6d53]
signal t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_6d53]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l577_c7_6d53]
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l577_c7_6d53]
signal n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l577_c7_6d53]
signal l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c7_6d53]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_0ca1]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l581_c7_0e50]
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l581_c7_0e50]
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_0e50]
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_0e50]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l581_c7_0e50]
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l581_c7_0e50]
signal n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l581_c7_0e50]
signal l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l581_c7_0e50]
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c11_bcf0]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_105c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l584_c7_7b2e]
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l588_c11_2758]
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_64ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l588_c7_105c]
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l588_c7_105c]
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_105c]
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_105c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l588_c7_105c]
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l588_c7_105c]
signal l8_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l588_c7_105c]
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l591_c11_980f]
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_476e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l591_c7_64ea]
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l591_c7_64ea]
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_64ea]
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_64ea]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l591_c7_64ea]
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l591_c7_64ea]
signal l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l591_c7_64ea]
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l595_c32_8a8b]
signal BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l595_c32_2a24]
signal BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l595_c32_7eaa]
signal MUX_uxn_opcodes_h_l595_c32_7eaa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l595_c32_7eaa_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l599_c32_7207]
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l599_c16_df63]
signal MUX_uxn_opcodes_h_l599_c16_df63_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_df63_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_df63_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_df63_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l600_c16_4a9d]
signal MUX_uxn_opcodes_h_l600_c16_4a9d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_4a9d_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l601_c23_9c99]
signal device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_9c99_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_9c99_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_9c99_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_9c99_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l608_c24_34e5]
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l609_c3_5821]
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l609_c3_5821]
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l613_c4_61a7]
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_89d6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.device_ram_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a
BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left,
BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right,
BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l567_c2_0632
device_out_result_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond,
device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l567_c2_0632
deo_param1_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond,
deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- t8_MUX_uxn_opcodes_h_l567_c2_0632
t8_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l567_c2_0632_cond,
t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632
result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632
result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632
result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l567_c2_0632
deo_param0_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond,
deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- n8_MUX_uxn_opcodes_h_l567_c2_0632
n8_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l567_c2_0632_cond,
n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- l8_MUX_uxn_opcodes_h_l567_c2_0632
l8_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l567_c2_0632_cond,
l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632
is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

-- printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4
printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4 : entity work.printf_uxn_opcodes_h_l568_c3_87e4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a
BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d
device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d
deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_e55d
t8_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d
result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d
result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d
deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_e55d
n8_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_e55d
l8_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d
is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628
BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53
device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53
deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- t8_MUX_uxn_opcodes_h_l577_c7_6d53
t8_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53
result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53
result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53
deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- n8_MUX_uxn_opcodes_h_l577_c7_6d53
n8_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- l8_MUX_uxn_opcodes_h_l577_c7_6d53
l8_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53
is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1
BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50
device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50
deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50
result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50
result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50
deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- n8_MUX_uxn_opcodes_h_l581_c7_0e50
n8_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- l8_MUX_uxn_opcodes_h_l581_c7_0e50
l8_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50
is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0
BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e
device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e
deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e
result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e
result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e
deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- n8_MUX_uxn_opcodes_h_l584_c7_7b2e
n8_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- l8_MUX_uxn_opcodes_h_l584_c7_7b2e
l8_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e
is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l588_c7_105c
device_out_result_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond,
device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l588_c7_105c
deo_param1_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond,
deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c
result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c
result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c
result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l588_c7_105c
deo_param0_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond,
deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- l8_MUX_uxn_opcodes_h_l588_c7_105c
l8_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l588_c7_105c_cond,
l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c
is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f
BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea
device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea
deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea
result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea
result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea
deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- l8_MUX_uxn_opcodes_h_l591_c7_64ea
l8_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea
is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b
BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left,
BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right,
BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24
BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left,
BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right,
BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output);

-- MUX_uxn_opcodes_h_l595_c32_7eaa
MUX_uxn_opcodes_h_l595_c32_7eaa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l595_c32_7eaa_cond,
MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue,
MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse,
MUX_uxn_opcodes_h_l595_c32_7eaa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left,
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right,
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output);

-- MUX_uxn_opcodes_h_l599_c16_df63
MUX_uxn_opcodes_h_l599_c16_df63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l599_c16_df63_cond,
MUX_uxn_opcodes_h_l599_c16_df63_iftrue,
MUX_uxn_opcodes_h_l599_c16_df63_iffalse,
MUX_uxn_opcodes_h_l599_c16_df63_return_output);

-- MUX_uxn_opcodes_h_l600_c16_4a9d
MUX_uxn_opcodes_h_l600_c16_4a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l600_c16_4a9d_cond,
MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue,
MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse,
MUX_uxn_opcodes_h_l600_c16_4a9d_return_output);

-- device_out_uxn_opcodes_h_l601_c23_9c99
device_out_uxn_opcodes_h_l601_c23_9c99 : entity work.device_out_0CLK_461bb655 port map (
clk,
device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l601_c23_9c99_device_address,
device_out_uxn_opcodes_h_l601_c23_9c99_value,
device_out_uxn_opcodes_h_l601_c23_9c99_phase,
device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read,
device_out_uxn_opcodes_h_l601_c23_9c99_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5
BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left,
BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right,
BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821
is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left,
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right,
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output,
 BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output,
 MUX_uxn_opcodes_h_l595_c32_7eaa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output,
 MUX_uxn_opcodes_h_l599_c16_df63_return_output,
 MUX_uxn_opcodes_h_l600_c16_4a9d_return_output,
 device_out_uxn_opcodes_h_l601_c23_9c99_return_output,
 BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l572_c3_e86c : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_7b96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_ddc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_6664 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_6428 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_50e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_f33b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_36f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_64ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_df63_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_df63_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_df63_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_df63_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_380c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_777f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_c29_4d52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_3ab8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_3e0f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l607_c23_d6ef_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l610_c4_5910 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l613_c4_77f6 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89d6_uxn_opcodes_h_l617_l560_DUPLICATE_a2f8_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_6428 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_6428;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_f33b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_f33b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_6664 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_6664;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_7b96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_7b96;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_36f2 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_36f2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l572_c3_e86c := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l572_c3_e86c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l610_c4_5910 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l610_c4_5910;
     VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_ddc1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_ddc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_50e3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_50e3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right := to_unsigned(4, 3);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l599_c16_df63_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left := t8;
     VAR_MUX_uxn_opcodes_h_l599_c16_df63_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l584_c11_bcf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l591_c11_980f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_left;
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output := BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_264a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output := result.device_ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_64ea_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_0ca1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l588_c11_2758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_left;
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output := BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l613_c4_61a7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l599_c32_7207] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_left;
     BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output := BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output := result.is_opc_done;

     -- MUX[uxn_opcodes_h_l600_c16_4a9d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l600_c16_4a9d_cond <= VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_cond;
     MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue <= VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iftrue;
     MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse <= VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_return_output := MUX_uxn_opcodes_h_l600_c16_4a9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l567_c6_957a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_left;
     BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output := BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l595_c32_8a8b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_left;
     BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output := BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l577_c11_2628] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_left;
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output := BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left := VAR_BIN_OP_AND_uxn_opcodes_h_l595_c32_8a8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_957a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_264a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_2628_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_0ca1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_bcf0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2758_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_980f_return_output;
     VAR_MUX_uxn_opcodes_h_l599_c16_df63_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_7207_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l613_c4_77f6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_61a7_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_c8da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a09d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_DUPLICATE_efe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l588_l577_l581_l584_l567_DUPLICATE_4d90_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_a06e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_1334_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_b184_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cae2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l574_l588_l577_l591_l581_l584_l567_DUPLICATE_cbd8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_return_output;
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_value := VAR_MUX_uxn_opcodes_h_l600_c16_4a9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l613_c4_77f6;
     -- t8_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l567_c1_72d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l595_c32_2a24] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_left;
     BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output := BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- n8_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- l8_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- MUX[uxn_opcodes_h_l599_c16_df63] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l599_c16_df63_cond <= VAR_MUX_uxn_opcodes_h_l599_c16_df63_cond;
     MUX_uxn_opcodes_h_l599_c16_df63_iftrue <= VAR_MUX_uxn_opcodes_h_l599_c16_df63_iftrue;
     MUX_uxn_opcodes_h_l599_c16_df63_iffalse <= VAR_MUX_uxn_opcodes_h_l599_c16_df63_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l599_c16_df63_return_output := MUX_uxn_opcodes_h_l599_c16_df63_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l595_c32_2a24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_MUX_uxn_opcodes_h_l599_c16_df63_return_output;
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_device_address := VAR_MUX_uxn_opcodes_h_l599_c16_df63_return_output;
     VAR_printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c1_72d6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_l8_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_n8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output := deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- l8_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output := l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- n8_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- printf_uxn_opcodes_h_l568_c3_87e4[uxn_opcodes_h_l568_c3_87e4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l568_c3_87e4_uxn_opcodes_h_l568_c3_87e4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l595_c32_7eaa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l595_c32_7eaa_cond <= VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_cond;
     MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue <= VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iftrue;
     MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse <= VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_return_output := MUX_uxn_opcodes_h_l595_c32_7eaa_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue := VAR_MUX_uxn_opcodes_h_l595_c32_7eaa_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_n8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output := deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- t8_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output := t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- n8_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- l8_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_l8_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- l8_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_l8_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     -- l8_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- n8_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output := n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- l8_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_476e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output;

     -- l8_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output := l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output := deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_476e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     -- device_out[uxn_opcodes_h_l601_c23_9c99] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l601_c23_9c99_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l601_c23_9c99_device_address <= VAR_device_out_uxn_opcodes_h_l601_c23_9c99_device_address;
     device_out_uxn_opcodes_h_l601_c23_9c99_value <= VAR_device_out_uxn_opcodes_h_l601_c23_9c99_value;
     device_out_uxn_opcodes_h_l601_c23_9c99_phase <= VAR_device_out_uxn_opcodes_h_l601_c23_9c99_phase;
     device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l601_c23_9c99_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output := device_out_uxn_opcodes_h_l601_c23_9c99_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output := deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l603_c31_777f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_777f_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l604_c29_4d52] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_c29_4d52_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l606_c25_3e0f] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_3e0f_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.vram_address;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l602_c32_380c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_380c_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l607_c23_d6ef] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l607_c23_d6ef_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l605_c26_3ab8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_3ab8_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_9c99_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_3043_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_380c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_3ab8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l607_c23_d6ef_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_3e0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_777f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l604_c29_4d52_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l608_c24_34e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_left;
     BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output := BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output := device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l609_c3_5821] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output := current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l609_c3_5821] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_cond;
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output := is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_34e5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_5821_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_5821_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_64ea] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output := current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_64ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l588_c7_105c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output := is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_105c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l584_c7_7b2e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output := is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_7b2e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_0e50] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output := current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_0e50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output := device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_6d53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_6d53_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_e55d] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_e55d_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output := is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output := current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l567_c2_0632] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_0632_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_89d6_uxn_opcodes_h_l617_l560_DUPLICATE_a2f8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89d6_uxn_opcodes_h_l617_l560_DUPLICATE_a2f8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_89d6(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_0632_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89d6_uxn_opcodes_h_l617_l560_DUPLICATE_a2f8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89d6_uxn_opcodes_h_l617_l560_DUPLICATE_a2f8_return_output;
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
