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
-- Submodules: 164
entity deo2_0CLK_29335e8f is
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
end deo2_0CLK_29335e8f;
architecture arch of deo2_0CLK_29335e8f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_805b]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c908]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_ae31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_17bd]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l533_c2_17bd]
signal t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c2_17bd]
signal n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_17bd]
signal l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_17bd]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_17bd]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_17bd]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_17bd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_17bd]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l534_c3_ca47[uxn_opcodes_h_l534_c3_ca47]
signal printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_9569]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_4b75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_ae31]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l543_c7_ae31]
signal t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l543_c7_ae31]
signal n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_ae31]
signal l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_ae31]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_ae31]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_ae31]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_ae31]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_ae31]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_14cc]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_4b75]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l547_c7_4b75]
signal t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l547_c7_4b75]
signal n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l547_c7_4b75]
signal l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_4b75]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_4b75]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_4b75]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_4b75]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_4b75]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l552_c11_fbbd]
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_c495]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l552_c7_ecfd]
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l556_c11_aeef]
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_adbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l556_c7_c495]
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l556_c7_c495]
signal n8_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l556_c7_c495]
signal l8_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l556_c7_c495]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l556_c7_c495]
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_c495]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_c495]
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l556_c7_c495]
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l561_c11_6066]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_b710]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l561_c7_adbb]
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l561_c7_adbb]
signal l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l561_c7_adbb]
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l561_c7_adbb]
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_adbb]
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_adbb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l561_c7_adbb]
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l565_c11_7f5e]
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_9ca5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l565_c7_b710]
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l565_c7_b710]
signal l8_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l565_c7_b710]
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l565_c7_b710]
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_b710]
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_b710]
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l565_c7_b710]
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l570_c32_6c85]
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l570_c32_b2a3]
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l570_c32_582a]
signal MUX_uxn_opcodes_h_l570_c32_582a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_582a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_582a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_582a_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_6ae1]
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l575_c16_5e80]
signal MUX_uxn_opcodes_h_l575_c16_5e80_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_5e80_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_5e80_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_5e80_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l576_c16_e888]
signal MUX_uxn_opcodes_h_l576_c16_e888_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e888_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e888_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e888_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l577_c23_f510]
signal device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_f510_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_f510_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_f510_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_f510_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l585_c24_f04e]
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l586_c3_3be6]
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_3be6]
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_58f6]
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_de76( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.device_ram_value := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.is_vram_write := ref_toks_11;
      base.is_opc_done := ref_toks_12;
      base.vram_value := ref_toks_13;
      base.device_ram_address := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b
BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd
deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_17bd
t8_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_17bd
n8_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_17bd
l8_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd
is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd
device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd
result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd
result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd
deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

-- printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47
printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47 : entity work.printf_uxn_opcodes_h_l534_c3_ca47_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569
BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31
deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_ae31
t8_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_ae31
n8_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_ae31
l8_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31
is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31
device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31
result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31
result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31
deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc
BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75
deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- t8_MUX_uxn_opcodes_h_l547_c7_4b75
t8_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_4b75
n8_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_4b75
l8_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75
is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75
device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75
result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75
result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75
deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd
BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd
deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- n8_MUX_uxn_opcodes_h_l552_c7_ecfd
n8_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- l8_MUX_uxn_opcodes_h_l552_c7_ecfd
l8_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd
is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd
device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd
result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd
result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd
deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond,
deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue,
deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse,
deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef
BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l556_c7_c495
deo_param1_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond,
deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- n8_MUX_uxn_opcodes_h_l556_c7_c495
n8_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l556_c7_c495_cond,
n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- l8_MUX_uxn_opcodes_h_l556_c7_c495
l8_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l556_c7_c495_cond,
l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495
is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l556_c7_c495
device_out_result_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond,
device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495
result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495
result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l556_c7_c495
deo_param0_MUX_uxn_opcodes_h_l556_c7_c495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond,
deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue,
deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse,
deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066
BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb
deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- l8_MUX_uxn_opcodes_h_l561_c7_adbb
l8_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb
is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb
device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb
result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb
result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb
deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond,
deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue,
deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse,
deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e
BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l565_c7_b710
deo_param1_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- l8_MUX_uxn_opcodes_h_l565_c7_b710
l8_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l565_c7_b710_cond,
l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l565_c7_b710
device_out_result_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l565_c7_b710
deo_param0_MUX_uxn_opcodes_h_l565_c7_b710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85
BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left,
BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right,
BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3
BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left,
BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right,
BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output);

-- MUX_uxn_opcodes_h_l570_c32_582a
MUX_uxn_opcodes_h_l570_c32_582a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l570_c32_582a_cond,
MUX_uxn_opcodes_h_l570_c32_582a_iftrue,
MUX_uxn_opcodes_h_l570_c32_582a_iffalse,
MUX_uxn_opcodes_h_l570_c32_582a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output);

-- MUX_uxn_opcodes_h_l575_c16_5e80
MUX_uxn_opcodes_h_l575_c16_5e80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l575_c16_5e80_cond,
MUX_uxn_opcodes_h_l575_c16_5e80_iftrue,
MUX_uxn_opcodes_h_l575_c16_5e80_iffalse,
MUX_uxn_opcodes_h_l575_c16_5e80_return_output);

-- MUX_uxn_opcodes_h_l576_c16_e888
MUX_uxn_opcodes_h_l576_c16_e888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l576_c16_e888_cond,
MUX_uxn_opcodes_h_l576_c16_e888_iftrue,
MUX_uxn_opcodes_h_l576_c16_e888_iffalse,
MUX_uxn_opcodes_h_l576_c16_e888_return_output);

-- device_out_uxn_opcodes_h_l577_c23_f510
device_out_uxn_opcodes_h_l577_c23_f510 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l577_c23_f510_device_address,
device_out_uxn_opcodes_h_l577_c23_f510_value,
device_out_uxn_opcodes_h_l577_c23_f510_phase,
device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read,
device_out_uxn_opcodes_h_l577_c23_f510_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e
BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left,
BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right,
BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6
is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output,
 BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output,
 BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output,
 MUX_uxn_opcodes_h_l570_c32_582a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output,
 MUX_uxn_opcodes_h_l575_c16_5e80_return_output,
 MUX_uxn_opcodes_h_l576_c16_e888_return_output,
 device_out_uxn_opcodes_h_l577_c23_f510_return_output,
 BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l541_c3_8246 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_344b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_69f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_8f9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_36bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_88bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_2a2d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_27f9 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_d938 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_582a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_582a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_582a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_582a_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_5e80_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_5e80_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e888_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e888_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e888_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e888_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_d502_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_2a93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_b4a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_c917_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_c754_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_68db_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_05b1_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l587_c4_185e : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l590_c4_ea0d : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de76_uxn_opcodes_h_l594_l526_DUPLICATE_b3f6_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_2a2d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_2a2d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_69f4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_69f4;
     VAR_current_deo_phase_uxn_opcodes_h_l541_c3_8246 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l541_c3_8246;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l570_c32_582a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_8f9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_8f9b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l587_c4_185e := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l587_c4_185e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_88bb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_88bb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_27f9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_27f9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_344b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_344b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_36bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_36bc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l570_c32_582a_iffalse := resize(to_signed(-3, 3), 8);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_d938 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_d938;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right := to_unsigned(4, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l575_c16_5e80_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_e888_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_e888_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l576_c16_e888_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left := t8;
     VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l556_c11_aeef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_left;
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output := BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;

     -- MUX[uxn_opcodes_h_l576_c16_e888] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l576_c16_e888_cond <= VAR_MUX_uxn_opcodes_h_l576_c16_e888_cond;
     MUX_uxn_opcodes_h_l576_c16_e888_iftrue <= VAR_MUX_uxn_opcodes_h_l576_c16_e888_iftrue;
     MUX_uxn_opcodes_h_l576_c16_e888_iffalse <= VAR_MUX_uxn_opcodes_h_l576_c16_e888_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l576_c16_e888_return_output := MUX_uxn_opcodes_h_l576_c16_e888_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output := result.is_device_ram_write;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b710_return_output := result.is_stack_read;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_17bd_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b710_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c11_6066] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_58f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_805b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l570_c32_6c85] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_left;
     BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output := BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_17bd_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l565_c11_7f5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_14cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l552_c11_fbbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_6ae1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_9569] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output := result.device_ram_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_6c85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_805b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_9569_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_14cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_fbbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_aeef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_6066_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_7f5e_return_output;
     VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_6ae1_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l590_c4_ea0d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_58f6_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_6c72_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_5b40_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ae72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_edaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_44ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_f135_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3169_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_93ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_e565_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_66fe_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_MUX_uxn_opcodes_h_l576_c16_e888_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_value := VAR_MUX_uxn_opcodes_h_l576_c16_e888_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l590_c4_ea0d;
     -- n8_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output := n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- MUX[uxn_opcodes_h_l575_c16_5e80] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l575_c16_5e80_cond <= VAR_MUX_uxn_opcodes_h_l575_c16_5e80_cond;
     MUX_uxn_opcodes_h_l575_c16_5e80_iftrue <= VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iftrue;
     MUX_uxn_opcodes_h_l575_c16_5e80_iffalse <= VAR_MUX_uxn_opcodes_h_l575_c16_5e80_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l575_c16_5e80_return_output := MUX_uxn_opcodes_h_l575_c16_5e80_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l570_c32_b2a3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_left;
     BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output := BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output := deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- l8_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output := l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- t8_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c908] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l570_c32_582a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_b2a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_MUX_uxn_opcodes_h_l575_c16_5e80_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_device_address := VAR_MUX_uxn_opcodes_h_l575_c16_5e80_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c908_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_l8_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_t8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     -- MUX[uxn_opcodes_h_l570_c32_582a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l570_c32_582a_cond <= VAR_MUX_uxn_opcodes_h_l570_c32_582a_cond;
     MUX_uxn_opcodes_h_l570_c32_582a_iftrue <= VAR_MUX_uxn_opcodes_h_l570_c32_582a_iftrue;
     MUX_uxn_opcodes_h_l570_c32_582a_iffalse <= VAR_MUX_uxn_opcodes_h_l570_c32_582a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l570_c32_582a_return_output := MUX_uxn_opcodes_h_l570_c32_582a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- n8_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- printf_uxn_opcodes_h_l534_c3_ca47[uxn_opcodes_h_l534_c3_ca47] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_ca47_uxn_opcodes_h_l534_c3_ca47_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- l8_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output := deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue := VAR_MUX_uxn_opcodes_h_l570_c32_582a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_l8_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_n8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- l8_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output := l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output := deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_l8_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- l8_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output := deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- n8_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_l8_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- l8_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     -- l8_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_9ca5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output;

     -- l8_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_9ca5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- device_out[uxn_opcodes_h_l577_c23_f510] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l577_c23_f510_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l577_c23_f510_device_address <= VAR_device_out_uxn_opcodes_h_l577_c23_f510_device_address;
     device_out_uxn_opcodes_h_l577_c23_f510_value <= VAR_device_out_uxn_opcodes_h_l577_c23_f510_value;
     device_out_uxn_opcodes_h_l577_c23_f510_phase <= VAR_device_out_uxn_opcodes_h_l577_c23_f510_phase;
     device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l577_c23_f510_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output := device_out_uxn_opcodes_h_l577_c23_f510_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l580_c31_b4a8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_b4a8_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l578_c32_d502] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_d502_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l584_c23_05b1] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_05b1_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l582_c26_c754] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_c754_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l579_c31_2a93] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_2a93_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l583_c25_68db] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_68db_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l581_c29_c917] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_c917_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_f510_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output := device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_d8bc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_2a93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_d502_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_c754_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_05b1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_68db_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_b4a8_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_c917_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l586_c3_3be6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output := is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l585_c24_f04e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_3be6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_f04e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_3be6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_3be6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output := is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output := current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_b710] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output := device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b710_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_adbb] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output := current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_adbb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_c495] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_c495_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_ecfd] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output := current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_ecfd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_4b75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_4b75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_ae31] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_ae31_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_17bd] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_17bd_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_de76_uxn_opcodes_h_l594_l526_DUPLICATE_b3f6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de76_uxn_opcodes_h_l594_l526_DUPLICATE_b3f6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_de76(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_17bd_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_17bd_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de76_uxn_opcodes_h_l594_l526_DUPLICATE_b3f6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de76_uxn_opcodes_h_l594_l526_DUPLICATE_b3f6_return_output;
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
