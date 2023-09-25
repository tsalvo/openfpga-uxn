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
-- Submodules: 169
entity deo2_0CLK_16853701 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_16853701;
architecture arch of deo2_0CLK_16853701 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l457_c6_143b]
signal BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l457_c1_f76b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l466_c7_1390]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l457_c2_61c9]
signal n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l457_c2_61c9]
signal t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l457_c2_61c9]
signal current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l457_c2_61c9]
signal is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l457_c2_61c9]
signal deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l457_c2_61c9]
signal device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l457_c2_61c9]
signal deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l457_c2_61c9]
signal result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l457_c2_61c9]
signal l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l458_c3_470e[uxn_opcodes_h_l458_c3_470e]
signal printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l461_c26_f92d]
signal BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l466_c11_f6e0]
signal BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l466_c7_1390]
signal n8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l466_c7_1390]
signal t8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l466_c7_1390]
signal current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l466_c7_1390]
signal is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l466_c7_1390]
signal deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l466_c7_1390]
signal device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l466_c7_1390]
signal deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l466_c7_1390]
signal result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l466_c7_1390]
signal l8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l468_c26_73f0]
signal BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l470_c11_d2a0]
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_4eee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l470_c7_6dfc]
signal l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l473_c26_189c]
signal BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c11_85c5]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_a04a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l475_c7_4eee]
signal n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l475_c7_4eee]
signal current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l475_c7_4eee]
signal is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l475_c7_4eee]
signal deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l475_c7_4eee]
signal device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l475_c7_4eee]
signal deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l475_c7_4eee]
signal result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l475_c7_4eee]
signal l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l477_c26_f2a0]
signal BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l479_c11_f818]
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l479_c7_a04a]
signal n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l479_c7_a04a]
signal current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l479_c7_a04a]
signal is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l479_c7_a04a]
signal deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l479_c7_a04a]
signal device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l479_c7_a04a]
signal deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l479_c7_a04a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l479_c7_a04a]
signal l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l482_c26_5854]
signal BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l484_c11_124e]
signal BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c7_050c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l484_c7_4d2a]
signal l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l486_c26_2fcf]
signal BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l488_c11_15e3]
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l496_c1_5c0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l488_c7_050c]
signal current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l488_c7_050c]
signal is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l488_c7_050c]
signal deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l488_c7_050c]
signal device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l488_c7_050c]
signal deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l488_c7_050c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l488_c7_050c]
signal l8_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l493_c16_036f]
signal BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l493_c35_7418]
signal BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l493_c16_3b8d]
signal MUX_uxn_opcodes_h_l493_c16_3b8d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l493_c16_3b8d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l499_c32_3c35]
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l499_c16_3504]
signal MUX_uxn_opcodes_h_l499_c16_3504_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l499_c16_3504_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l499_c16_3504_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l499_c16_3504_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l500_c16_48f5]
signal MUX_uxn_opcodes_h_l500_c16_48f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l500_c16_48f5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l500_c16_48f5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l500_c16_48f5_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l501_c23_ea5d]
signal device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l501_c23_ea5d_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l501_c23_ea5d_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l501_c23_ea5d_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l501_c23_ea5d_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l509_c24_6e5b]
signal BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l510_c3_fd9b]
signal current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l510_c3_fd9b]
signal is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l514_c4_c7da]
signal BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_745e( ref_toks_0 : opcode_result_t;
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
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.vram_address := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.stack_address := ref_toks_10;
      base.is_sp_updated := ref_toks_11;
      base.sp := ref_toks_12;
      base.device_ram_value := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b
BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left,
BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right,
BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- n8_MUX_uxn_opcodes_h_l457_c2_61c9
n8_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- t8_MUX_uxn_opcodes_h_l457_c2_61c9
t8_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9
current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9
is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9
deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9
device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9
deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9
result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9
result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9
result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9
result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9
result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_sp_MUX_uxn_opcodes_h_l457_c2_61c9
result_sp_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9
result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- l8_MUX_uxn_opcodes_h_l457_c2_61c9
l8_MUX_uxn_opcodes_h_l457_c2_61c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond,
l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue,
l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse,
l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

-- printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e
printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e : entity work.printf_uxn_opcodes_h_l458_c3_470e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE);

-- BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d
BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left,
BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right,
BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0
BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left,
BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right,
BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- n8_MUX_uxn_opcodes_h_l466_c7_1390
n8_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l466_c7_1390_cond,
n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- t8_MUX_uxn_opcodes_h_l466_c7_1390
t8_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l466_c7_1390_cond,
t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390
current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond,
current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390
is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond,
is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l466_c7_1390
deo_param0_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond,
deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l466_c7_1390
device_out_result_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond,
device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l466_c7_1390
deo_param1_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond,
deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390
result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390
result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390
result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390
result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390
result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390
result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390
result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390
result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390
result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_sp_MUX_uxn_opcodes_h_l466_c7_1390
result_sp_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390
result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- l8_MUX_uxn_opcodes_h_l466_c7_1390
l8_MUX_uxn_opcodes_h_l466_c7_1390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l466_c7_1390_cond,
l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue,
l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse,
l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0
BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left,
BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right,
BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0
BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- n8_MUX_uxn_opcodes_h_l470_c7_6dfc
n8_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- t8_MUX_uxn_opcodes_h_l470_c7_6dfc
t8_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc
is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc
deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc
device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc
deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc
result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc
result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc
result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc
result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc
result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- l8_MUX_uxn_opcodes_h_l470_c7_6dfc
l8_MUX_uxn_opcodes_h_l470_c7_6dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond,
l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue,
l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse,
l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c
BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left,
BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right,
BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5
BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- n8_MUX_uxn_opcodes_h_l475_c7_4eee
n8_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee
current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee
is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee
deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee
device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee
deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee
result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee
result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee
result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee
result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_sp_MUX_uxn_opcodes_h_l475_c7_4eee
result_sp_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee
result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- l8_MUX_uxn_opcodes_h_l475_c7_4eee
l8_MUX_uxn_opcodes_h_l475_c7_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond,
l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue,
l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse,
l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0
BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left,
BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right,
BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818
BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- n8_MUX_uxn_opcodes_h_l479_c7_a04a
n8_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a
current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a
is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a
deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a
device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a
deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a
result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a
result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a
result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a
result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_sp_MUX_uxn_opcodes_h_l479_c7_a04a
result_sp_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a
result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- l8_MUX_uxn_opcodes_h_l479_c7_a04a
l8_MUX_uxn_opcodes_h_l479_c7_a04a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond,
l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue,
l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse,
l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854
BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left,
BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right,
BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e
BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left,
BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right,
BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a
current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a
is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a
deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a
device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a
deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a
result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a
result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a
result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a
result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a
result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a
result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a
result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- l8_MUX_uxn_opcodes_h_l484_c7_4d2a
l8_MUX_uxn_opcodes_h_l484_c7_4d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond,
l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue,
l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse,
l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf
BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left,
BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right,
BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3
BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left,
BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right,
BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c
current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c
is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond,
is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l488_c7_050c
deo_param0_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond,
deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l488_c7_050c
device_out_result_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond,
device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l488_c7_050c
deo_param1_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond,
deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c
result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c
result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c
result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c
result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c
result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c
result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l488_c7_050c
result_sp_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c
result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- l8_MUX_uxn_opcodes_h_l488_c7_050c
l8_MUX_uxn_opcodes_h_l488_c7_050c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l488_c7_050c_cond,
l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue,
l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse,
l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l493_c16_036f
BIN_OP_AND_uxn_opcodes_h_l493_c16_036f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left,
BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right,
BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418
BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left,
BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right,
BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output);

-- MUX_uxn_opcodes_h_l493_c16_3b8d
MUX_uxn_opcodes_h_l493_c16_3b8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l493_c16_3b8d_cond,
MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue,
MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse,
MUX_uxn_opcodes_h_l493_c16_3b8d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35
BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left,
BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right,
BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output);

-- MUX_uxn_opcodes_h_l499_c16_3504
MUX_uxn_opcodes_h_l499_c16_3504 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l499_c16_3504_cond,
MUX_uxn_opcodes_h_l499_c16_3504_iftrue,
MUX_uxn_opcodes_h_l499_c16_3504_iffalse,
MUX_uxn_opcodes_h_l499_c16_3504_return_output);

-- MUX_uxn_opcodes_h_l500_c16_48f5
MUX_uxn_opcodes_h_l500_c16_48f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l500_c16_48f5_cond,
MUX_uxn_opcodes_h_l500_c16_48f5_iftrue,
MUX_uxn_opcodes_h_l500_c16_48f5_iffalse,
MUX_uxn_opcodes_h_l500_c16_48f5_return_output);

-- device_out_uxn_opcodes_h_l501_c23_ea5d
device_out_uxn_opcodes_h_l501_c23_ea5d : entity work.device_out_0CLK_b72c91ff port map (
clk,
device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l501_c23_ea5d_device_address,
device_out_uxn_opcodes_h_l501_c23_ea5d_value,
device_out_uxn_opcodes_h_l501_c23_ea5d_phase,
device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read,
device_out_uxn_opcodes_h_l501_c23_ea5d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b
BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left,
BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right,
BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b
current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b
is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond,
is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da
BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left,
BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right,
BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 ins,
 pc,
 sp,
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
 BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output,
 MUX_uxn_opcodes_h_l493_c16_3b8d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output,
 MUX_uxn_opcodes_h_l499_c16_3504_return_output,
 MUX_uxn_opcodes_h_l500_c16_48f5_return_output,
 device_out_uxn_opcodes_h_l501_c23_ea5d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l464_c3_c29f : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l491_c3_b6f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l488_c7_050c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l498_c3_ab10 : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c16_3504_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c16_3504_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c16_3504_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c16_3504_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l500_c16_48f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l500_c16_48f5_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l502_c32_a228_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l503_c31_bb01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l504_c31_b026_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l505_c29_186d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l506_c26_aff2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l507_c25_c332_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l508_c23_0b21_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l511_c4_9cd8 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l514_c4_0253 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l518_l450_DUPLICATE_29cd_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right := to_unsigned(2, 2);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l511_c4_9cd8 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l511_c4_9cd8;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right := to_unsigned(5, 3);
     VAR_result_sp_uxn_opcodes_h_l498_c3_ab10 := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_result_sp_uxn_opcodes_h_l498_c3_ab10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right := to_unsigned(1, 1);
     VAR_result_stack_address_uxn_opcodes_h_l491_c3_b6f1 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_result_stack_address_uxn_opcodes_h_l491_c3_b6f1;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l464_c3_c29f := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l464_c3_c29f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l499_c16_3504_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l500_c16_48f5_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left := VAR_sp;
     VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left := t8;
     VAR_MUX_uxn_opcodes_h_l499_c16_3504_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output := result.sp;

     -- BIN_OP_MINUS[uxn_opcodes_h_l473_c26_189c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l499_c32_3c35] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_left;
     BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output := BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l484_c11_124e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_left;
     BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output := BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l493_c35_7418] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_left;
     BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output := BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output := result.vram_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l457_c2_61c9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l475_c11_85c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output := result.is_sp_updated;

     -- BIN_OP_MINUS[uxn_opcodes_h_l482_c26_5854] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_left;
     BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output := BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_c7_050c_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l457_c6_143b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_left;
     BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output := BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l493_c16_036f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_left;
     BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output := BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l479_c11_f818] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_left;
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output := BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l468_c26_73f0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_left;
     BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output := BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l486_c26_2fcf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_left;
     BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output := BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output := result.is_device_ram_read;

     -- BIN_OP_MINUS[uxn_opcodes_h_l461_c26_f92d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_left;
     BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output := BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l470_c11_d2a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;

     -- MUX[uxn_opcodes_h_l500_c16_48f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l500_c16_48f5_cond <= VAR_MUX_uxn_opcodes_h_l500_c16_48f5_cond;
     MUX_uxn_opcodes_h_l500_c16_48f5_iftrue <= VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iftrue;
     MUX_uxn_opcodes_h_l500_c16_48f5_iffalse <= VAR_MUX_uxn_opcodes_h_l500_c16_48f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l500_c16_48f5_return_output := MUX_uxn_opcodes_h_l500_c16_48f5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l514_c4_c7da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output;

     -- result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l488_c7_050c_return_output := result.stack_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l488_c11_15e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l466_c11_f6e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output := result.device_ram_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l477_c26_f2a0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_left;
     BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output := BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l493_c16_036f_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c6_143b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l466_c11_f6e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_d2a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_85c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_f818_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l484_c11_124e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_15e3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l461_c26_f92d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l468_c26_73f0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l473_c26_189c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l477_c26_f2a0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l482_c26_5854_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l486_c26_2fcf_return_output;
     VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse := VAR_BIN_OP_MINUS_uxn_opcodes_h_l493_c35_7418_return_output;
     VAR_MUX_uxn_opcodes_h_l499_c16_3504_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c32_3c35_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l514_c4_0253 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l514_c4_c7da_return_output, 8);
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_21cb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_2a42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l466_l488_l484_l479_l475_l470_DUPLICATE_7da1_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_bfbb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_5a56_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_aaab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_650a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_d240_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l466_l457_l488_l484_l479_l475_l470_DUPLICATE_4c13_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l466_l457_l484_l479_l475_l470_DUPLICATE_aba9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_MUX_uxn_opcodes_h_l500_c16_48f5_return_output;
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_value := VAR_MUX_uxn_opcodes_h_l500_c16_48f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l457_c2_61c9_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l514_c4_0253;
     -- n8_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- MUX[uxn_opcodes_h_l499_c16_3504] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l499_c16_3504_cond <= VAR_MUX_uxn_opcodes_h_l499_c16_3504_cond;
     MUX_uxn_opcodes_h_l499_c16_3504_iftrue <= VAR_MUX_uxn_opcodes_h_l499_c16_3504_iftrue;
     MUX_uxn_opcodes_h_l499_c16_3504_iffalse <= VAR_MUX_uxn_opcodes_h_l499_c16_3504_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l499_c16_3504_return_output := MUX_uxn_opcodes_h_l499_c16_3504_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output := deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l457_c1_f76b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- l8_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output := l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- t8_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- MUX[uxn_opcodes_h_l493_c16_3b8d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l493_c16_3b8d_cond <= VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_cond;
     MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue <= VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iftrue;
     MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse <= VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_return_output := MUX_uxn_opcodes_h_l493_c16_3b8d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue := VAR_MUX_uxn_opcodes_h_l493_c16_3b8d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_MUX_uxn_opcodes_h_l499_c16_3504_return_output;
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_device_address := VAR_MUX_uxn_opcodes_h_l499_c16_3504_return_output;
     VAR_printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c1_f76b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_t8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- printf_uxn_opcodes_h_l458_c3_470e[uxn_opcodes_h_l458_c3_470e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l458_c3_470e_uxn_opcodes_h_l458_c3_470e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- t8_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output := t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- l8_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output := deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     -- t8_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- n8_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- l8_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_l8_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_n8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     -- l8_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- n8_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output := n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_l8_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     -- n8_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- l8_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_l8_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     -- result_is_sp_updated_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output := deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- l8_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output := l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     -- result_is_sp_updated_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output := deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- l8_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l496_c1_5c0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l496_c1_5c0e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- device_out[uxn_opcodes_h_l501_c23_ea5d] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l501_c23_ea5d_device_address <= VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_device_address;
     device_out_uxn_opcodes_h_l501_c23_ea5d_value <= VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_value;
     device_out_uxn_opcodes_h_l501_c23_ea5d_phase <= VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_phase;
     device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output := device_out_uxn_opcodes_h_l501_c23_ea5d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l505_c29_186d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l505_c29_186d_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l506_c26_aff2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l506_c26_aff2_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l502_c32_a228] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l502_c32_a228_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l503_c31_bb01] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l503_c31_bb01_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.is_device_ram_read;

     -- device_out_result_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output := device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l508_c23_0b21] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l508_c23_0b21_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l504_c31_b026] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l504_c31_b026_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l507_c25_c332] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l507_c25_c332_return_output := VAR_device_out_uxn_opcodes_h_l501_c23_ea5d_return_output.vram_address;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l509_l510_DUPLICATE_ce64_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l503_c31_bb01_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l502_c32_a228_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l506_c26_aff2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l508_c23_0b21_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l507_c25_c332_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l504_c31_b026_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l505_c29_186d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l509_c24_6e5b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_left;
     BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output := BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l510_c3_fd9b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l510_c3_fd9b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output := is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l509_c24_6e5b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l510_c3_fd9b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output := is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l488_c7_050c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_050c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l484_c7_4d2a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l484_c7_4d2a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_a04a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_a04a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output := device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l475_c7_4eee] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_cond;
     is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output := is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_4eee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l470_c7_6dfc] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output := current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_6dfc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output := is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output := current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l466_c7_1390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c7_1390_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l457_c2_61c9] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_cond;
     is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output := is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l457_c2_61c9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l518_l450_DUPLICATE_29cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l518_l450_DUPLICATE_29cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_745e(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l457_c2_61c9_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l457_c2_61c9_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l518_l450_DUPLICATE_29cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l518_l450_DUPLICATE_29cd_return_output;
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
