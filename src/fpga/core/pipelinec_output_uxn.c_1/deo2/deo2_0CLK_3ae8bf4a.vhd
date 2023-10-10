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
-- BIN_OP_EQ[uxn_opcodes_h_l584_c6_b456]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_21e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l592_c7_715c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l584_c2_5091]
signal deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l584_c2_5091]
signal t8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l584_c2_5091]
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l584_c2_5091]
signal device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l584_c2_5091]
signal is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l584_c2_5091]
signal l8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_5091]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l584_c2_5091]
signal n8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l584_c2_5091]
signal deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l585_c3_1528[uxn_opcodes_h_l585_c3_1528]
signal printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l592_c11_861f]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l595_c7_34fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l592_c7_715c]
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c7_715c]
signal t8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l592_c7_715c]
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l592_c7_715c]
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l592_c7_715c]
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l592_c7_715c]
signal l8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_715c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l592_c7_715c]
signal n8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l592_c7_715c]
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l595_c11_0873]
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c7_3c72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l595_c7_34fc]
signal deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l595_c7_34fc]
signal t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l595_c7_34fc]
signal current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l595_c7_34fc]
signal device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l595_c7_34fc]
signal is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l595_c7_34fc]
signal l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l595_c7_34fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l595_c7_34fc]
signal n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l595_c7_34fc]
signal deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_7997]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l599_c7_3c72]
signal deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l599_c7_3c72]
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l599_c7_3c72]
signal device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l599_c7_3c72]
signal is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l599_c7_3c72]
signal l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_3c72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l599_c7_3c72]
signal n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l599_c7_3c72]
signal deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l602_c11_42a0]
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l602_c7_1b0b]
signal deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l606_c11_43f9]
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c7_3701]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l606_c7_fa2f]
signal deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_8861]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l616_c1_551f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l609_c7_3701]
signal deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l609_c7_3701]
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l609_c7_3701]
signal device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l609_c7_3701]
signal is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l609_c7_3701]
signal l8_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output : signed(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_3701]
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l609_c7_3701]
signal deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l614_c32_5738]
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l614_c32_3670]
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l614_c32_a87d]
signal MUX_uxn_opcodes_h_l614_c32_a87d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_a87d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_a87d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_a87d_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l618_c32_bda3]
signal BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l618_c16_e1f4]
signal MUX_uxn_opcodes_h_l618_c16_e1f4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l618_c16_e1f4_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l619_c16_c30d]
signal MUX_uxn_opcodes_h_l619_c16_c30d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l619_c16_c30d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l619_c16_c30d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l619_c16_c30d_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l620_c23_03d5]
signal device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l620_c23_03d5_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l620_c23_03d5_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l620_c23_03d5_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l620_c23_03d5_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l628_c24_bf2b]
signal BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l629_c3_7519]
signal current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l629_c3_7519]
signal is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l633_c4_9d59]
signal BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e79( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.device_ram_value := ref_toks_9;
      base.device_ram_address := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;
      base.is_opc_done := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456
BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l584_c2_5091
deo_param0_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond,
deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- t8_MUX_uxn_opcodes_h_l584_c2_5091
t8_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l584_c2_5091_cond,
t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091
current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond,
current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l584_c2_5091
device_out_result_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond,
device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091
is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond,
is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- l8_MUX_uxn_opcodes_h_l584_c2_5091
l8_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l584_c2_5091_cond,
l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091
result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091
result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091
result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091
result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091
result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091
result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091
result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- n8_MUX_uxn_opcodes_h_l584_c2_5091
n8_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l584_c2_5091_cond,
n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l584_c2_5091
deo_param1_MUX_uxn_opcodes_h_l584_c2_5091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond,
deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue,
deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse,
deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

-- printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528
printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528 : entity work.printf_uxn_opcodes_h_l585_c3_1528_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f
BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l592_c7_715c
deo_param0_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond,
deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c7_715c
t8_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c7_715c_cond,
t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l592_c7_715c
device_out_result_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond,
device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c
is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- l8_MUX_uxn_opcodes_h_l592_c7_715c
l8_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l592_c7_715c_cond,
l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c
result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c
result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c
result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c
result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c
result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- n8_MUX_uxn_opcodes_h_l592_c7_715c
n8_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l592_c7_715c_cond,
n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l592_c7_715c
deo_param1_MUX_uxn_opcodes_h_l592_c7_715c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond,
deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873
BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left,
BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right,
BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc
deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- t8_MUX_uxn_opcodes_h_l595_c7_34fc
t8_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc
current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc
device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc
is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- l8_MUX_uxn_opcodes_h_l595_c7_34fc
l8_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc
result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc
result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc
result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc
result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc
result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- n8_MUX_uxn_opcodes_h_l595_c7_34fc
n8_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc
deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond,
deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue,
deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse,
deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997
BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72
deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72
current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72
device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72
is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- l8_MUX_uxn_opcodes_h_l599_c7_3c72
l8_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72
result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72
result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72
result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72
result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- n8_MUX_uxn_opcodes_h_l599_c7_3c72
n8_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72
deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond,
deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue,
deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse,
deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0
BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b
deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b
current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b
device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b
is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- l8_MUX_uxn_opcodes_h_l602_c7_1b0b
l8_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b
result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b
result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b
result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b
result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- n8_MUX_uxn_opcodes_h_l602_c7_1b0b
n8_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b
deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond,
deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue,
deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse,
deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9
BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left,
BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right,
BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f
deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f
current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f
device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f
is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- l8_MUX_uxn_opcodes_h_l606_c7_fa2f
l8_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f
result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f
result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f
result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f
result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f
result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f
deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond,
deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861
BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l609_c7_3701
deo_param0_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond,
deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701
current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond,
current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l609_c7_3701
device_out_result_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond,
device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701
is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond,
is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- l8_MUX_uxn_opcodes_h_l609_c7_3701
l8_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l609_c7_3701_cond,
l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701
result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701
result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701
result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701
result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701
result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701
result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701
result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l609_c7_3701
deo_param1_MUX_uxn_opcodes_h_l609_c7_3701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond,
deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue,
deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse,
deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l614_c32_5738
BIN_OP_AND_uxn_opcodes_h_l614_c32_5738 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left,
BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right,
BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l614_c32_3670
BIN_OP_GT_uxn_opcodes_h_l614_c32_3670 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left,
BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right,
BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output);

-- MUX_uxn_opcodes_h_l614_c32_a87d
MUX_uxn_opcodes_h_l614_c32_a87d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l614_c32_a87d_cond,
MUX_uxn_opcodes_h_l614_c32_a87d_iftrue,
MUX_uxn_opcodes_h_l614_c32_a87d_iffalse,
MUX_uxn_opcodes_h_l614_c32_a87d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3
BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left,
BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right,
BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output);

-- MUX_uxn_opcodes_h_l618_c16_e1f4
MUX_uxn_opcodes_h_l618_c16_e1f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l618_c16_e1f4_cond,
MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue,
MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse,
MUX_uxn_opcodes_h_l618_c16_e1f4_return_output);

-- MUX_uxn_opcodes_h_l619_c16_c30d
MUX_uxn_opcodes_h_l619_c16_c30d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l619_c16_c30d_cond,
MUX_uxn_opcodes_h_l619_c16_c30d_iftrue,
MUX_uxn_opcodes_h_l619_c16_c30d_iffalse,
MUX_uxn_opcodes_h_l619_c16_c30d_return_output);

-- device_out_uxn_opcodes_h_l620_c23_03d5
device_out_uxn_opcodes_h_l620_c23_03d5 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l620_c23_03d5_device_address,
device_out_uxn_opcodes_h_l620_c23_03d5_value,
device_out_uxn_opcodes_h_l620_c23_03d5_phase,
device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read,
device_out_uxn_opcodes_h_l620_c23_03d5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b
BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left,
BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right,
BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519
current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond,
current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519
is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond,
is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59
BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left,
BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right,
BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output,
 BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output,
 BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output,
 MUX_uxn_opcodes_h_l614_c32_a87d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output,
 MUX_uxn_opcodes_h_l618_c16_e1f4_return_output,
 MUX_uxn_opcodes_h_l619_c16_c30d_return_output,
 device_out_uxn_opcodes_h_l620_c23_03d5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l590_c3_9a77 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2f20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_2f7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l597_c3_e84c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_cb9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l604_c3_af11 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_37b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_3ceb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l609_c7_3701_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_a87d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_a87d_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l619_c16_c30d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l619_c16_c30d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l621_c32_45a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l622_c31_c869_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l623_c31_6911_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l624_c29_c390_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l625_c26_517b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l626_c25_e65e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l627_c23_a5f2_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l630_c4_ac5a : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l633_c4_b780 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l577_l637_DUPLICATE_0998_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l604_c3_af11 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l604_c3_af11;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_2f7a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_2f7a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l597_c3_e84c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l597_c3_e84c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2f20 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2f20;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_3ceb := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l612_c3_3ceb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right := to_unsigned(2, 2);
     VAR_current_deo_phase_uxn_opcodes_h_l630_c4_ac5a := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l630_c4_ac5a;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_37b3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_37b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right := to_unsigned(4, 3);
     VAR_current_deo_phase_uxn_opcodes_h_l590_c3_9a77 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l590_c3_9a77;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_cb9a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_cb9a;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iffalse := resize(to_signed(-3, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l619_c16_c30d_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left := t8;
     VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l618_c32_bda3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output := result.is_stack_read;

     -- MUX[uxn_opcodes_h_l619_c16_c30d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l619_c16_c30d_cond <= VAR_MUX_uxn_opcodes_h_l619_c16_c30d_cond;
     MUX_uxn_opcodes_h_l619_c16_c30d_iftrue <= VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iftrue;
     MUX_uxn_opcodes_h_l619_c16_c30d_iffalse <= VAR_MUX_uxn_opcodes_h_l619_c16_c30d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l619_c16_c30d_return_output := MUX_uxn_opcodes_h_l619_c16_c30d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c6_b456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l606_c11_43f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l633_c4_9d59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l609_c7_3701_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l595_c11_0873] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_left;
     BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output := BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_8861] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l602_c11_42a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l614_c32_5738] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_left;
     BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output := BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_7997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c11_861f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left := VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_5738_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_b456_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_861f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_0873_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_7997_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_42a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_43f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_8861_return_output;
     VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l618_c32_bda3_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l633_c4_b780 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l633_c4_9d59_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_5ade_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_b139_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_a489_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_DUPLICATE_7f3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l609_DUPLICATE_46fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_0413_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_e803_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_cd81_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_7cce_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l606_l602_l599_l595_l592_l584_l609_DUPLICATE_6b14_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_MUX_uxn_opcodes_h_l619_c16_c30d_return_output;
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_value := VAR_MUX_uxn_opcodes_h_l619_c16_c30d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l633_c4_b780;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- MUX[uxn_opcodes_h_l618_c16_e1f4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l618_c16_e1f4_cond <= VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_cond;
     MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue <= VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iftrue;
     MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse <= VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_return_output := MUX_uxn_opcodes_h_l618_c16_e1f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- n8_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- l8_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output := l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output := deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_21e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l614_c32_3670] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_left;
     BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output := BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l614_c32_a87d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_3670_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_return_output;
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_device_address := VAR_MUX_uxn_opcodes_h_l618_c16_e1f4_return_output;
     VAR_printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_21e9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_n8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- n8_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- printf_uxn_opcodes_h_l585_c3_1528[uxn_opcodes_h_l585_c3_1528] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l585_c3_1528_uxn_opcodes_h_l585_c3_1528_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- t8_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output := t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output := deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- MUX[uxn_opcodes_h_l614_c32_a87d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l614_c32_a87d_cond <= VAR_MUX_uxn_opcodes_h_l614_c32_a87d_cond;
     MUX_uxn_opcodes_h_l614_c32_a87d_iftrue <= VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iftrue;
     MUX_uxn_opcodes_h_l614_c32_a87d_iffalse <= VAR_MUX_uxn_opcodes_h_l614_c32_a87d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l614_c32_a87d_return_output := MUX_uxn_opcodes_h_l614_c32_a87d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- l8_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue := VAR_MUX_uxn_opcodes_h_l614_c32_a87d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_t8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- l8_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- t8_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output := t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- n8_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_l8_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     -- l8_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- n8_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output := n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_l8_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_n8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- n8_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output := n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- l8_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_l8_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- l8_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output := l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output := deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_l8_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output := deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- l8_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output := l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l616_c1_551f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output := deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c1_551f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output := deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- device_out[uxn_opcodes_h_l620_c23_03d5] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l620_c23_03d5_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l620_c23_03d5_device_address <= VAR_device_out_uxn_opcodes_h_l620_c23_03d5_device_address;
     device_out_uxn_opcodes_h_l620_c23_03d5_value <= VAR_device_out_uxn_opcodes_h_l620_c23_03d5_value;
     device_out_uxn_opcodes_h_l620_c23_03d5_phase <= VAR_device_out_uxn_opcodes_h_l620_c23_03d5_phase;
     device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l620_c23_03d5_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output := device_out_uxn_opcodes_h_l620_c23_03d5_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l624_c29_c390] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l624_c29_c390_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output := device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.is_deo_done;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l626_c25_e65e] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l626_c25_e65e_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l622_c31_c869] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l622_c31_c869_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l621_c32_45a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l621_c32_45a8_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l627_c23_a5f2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l627_c23_a5f2_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l625_c26_517b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l625_c26_517b_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l623_c31_6911] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l623_c31_6911_return_output := VAR_device_out_uxn_opcodes_h_l620_c23_03d5_return_output.device_ram_address;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l628_l629_DUPLICATE_1c76_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l622_c31_c869_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l621_c32_45a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l625_c26_517b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l627_c23_a5f2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l626_c25_e65e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l623_c31_6911_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l624_c29_c390_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l629_c3_7519] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output := current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l629_c3_7519] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_cond;
     is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output := is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l628_c24_bf2b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_left;
     BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output := BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l628_c24_bf2b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l629_c3_7519_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l629_c3_7519_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output := current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output := is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_3701] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_3701_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l606_c7_fa2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l606_c7_fa2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_1b0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_1b0b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l599_c7_3c72] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output := current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output := device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3c72_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output := device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l595_c7_34fc] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_cond;
     is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output := is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l595_c7_34fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output := is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l592_c7_715c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_715c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output := current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l584_c2_5091] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_cond;
     is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output := is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c2_5091_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l577_l637_DUPLICATE_0998 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l577_l637_DUPLICATE_0998_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e79(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5091_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5091_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l577_l637_DUPLICATE_0998_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e79_uxn_opcodes_h_l577_l637_DUPLICATE_0998_return_output;
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
