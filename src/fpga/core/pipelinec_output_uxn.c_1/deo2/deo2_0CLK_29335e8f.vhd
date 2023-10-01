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
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_2a9f]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c07a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_26d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_f6db]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_f6db]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_f6db]
signal l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_f6db]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_f6db]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l533_c2_f6db]
signal t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_f6db]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c2_f6db]
signal n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_f6db]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l534_c3_977e[uxn_opcodes_h_l534_c3_977e]
signal printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_503d]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_dcec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_26d1]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_26d1]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_26d1]
signal l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_26d1]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_26d1]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l543_c7_26d1]
signal t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_26d1]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l543_c7_26d1]
signal n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_26d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_ca49]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_dcec]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_dcec]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l547_c7_dcec]
signal l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_dcec]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_dcec]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l547_c7_dcec]
signal t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_dcec]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l547_c7_dcec]
signal n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_dcec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l552_c11_68eb]
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_d54d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_d8e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l556_c11_a75f]
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_ef04]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l556_c7_d54d]
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l556_c7_d54d]
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l556_c7_d54d]
signal l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_d54d]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l556_c7_d54d]
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l556_c7_d54d]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l556_c7_d54d]
signal n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_d54d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l561_c11_0d95]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l561_c7_ef04]
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l561_c7_ef04]
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l561_c7_ef04]
signal l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_ef04]
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l561_c7_ef04]
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l561_c7_ef04]
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_ef04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l565_c11_9b52]
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_51ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_2d2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : signed(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l570_c32_ffa8]
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l570_c32_1bb0]
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l570_c32_6218]
signal MUX_uxn_opcodes_h_l570_c32_6218_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_6218_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_6218_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_6218_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_d32b]
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l575_c16_65f7]
signal MUX_uxn_opcodes_h_l575_c16_65f7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_65f7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_65f7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_65f7_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l576_c16_ce5f]
signal MUX_uxn_opcodes_h_l576_c16_ce5f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_ce5f_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l577_c23_a8f1]
signal device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_a8f1_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_a8f1_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_a8f1_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_a8f1_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l585_c24_7726]
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_9223]
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l586_c3_9223]
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_da13]
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5f30( ref_toks_0 : opcode_result_t;
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
 ref_toks_12 : signed;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.device_ram_value := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_sp_shift := ref_toks_11;
      base.sp_relative_shift := ref_toks_12;
      base.stack_address_sp_offset := ref_toks_13;
      base.is_stack_index_flipped := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db
deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db
deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_f6db
l8_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db
device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_f6db
t8_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db
is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_f6db
n8_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db
result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db
result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

-- printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e
printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e : entity work.printf_uxn_opcodes_h_l534_c3_977e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d
BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1
deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1
deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_26d1
l8_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1
device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_26d1
t8_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1
is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_26d1
n8_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1
result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1
result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49
BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec
deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec
deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_dcec
l8_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec
device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- t8_MUX_uxn_opcodes_h_l547_c7_dcec
t8_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec
is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_dcec
n8_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec
result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec
result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb
BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1
deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1
deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- l8_MUX_uxn_opcodes_h_l552_c7_d8e1
l8_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1
device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1
is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- n8_MUX_uxn_opcodes_h_l552_c7_d8e1
n8_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1
result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1
result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f
BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d
deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d
deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- l8_MUX_uxn_opcodes_h_l556_c7_d54d
l8_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d
device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- n8_MUX_uxn_opcodes_h_l556_c7_d54d
n8_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95
BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04
deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04
deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- l8_MUX_uxn_opcodes_h_l561_c7_ef04
l8_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04
device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04
is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04
result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04
result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52
BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c
deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c
deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- l8_MUX_uxn_opcodes_h_l565_c7_2d2c
l8_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c
device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c
is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c
result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c
result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8
BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left,
BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right,
BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0
BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left,
BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right,
BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output);

-- MUX_uxn_opcodes_h_l570_c32_6218
MUX_uxn_opcodes_h_l570_c32_6218 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l570_c32_6218_cond,
MUX_uxn_opcodes_h_l570_c32_6218_iftrue,
MUX_uxn_opcodes_h_l570_c32_6218_iffalse,
MUX_uxn_opcodes_h_l570_c32_6218_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output);

-- MUX_uxn_opcodes_h_l575_c16_65f7
MUX_uxn_opcodes_h_l575_c16_65f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l575_c16_65f7_cond,
MUX_uxn_opcodes_h_l575_c16_65f7_iftrue,
MUX_uxn_opcodes_h_l575_c16_65f7_iffalse,
MUX_uxn_opcodes_h_l575_c16_65f7_return_output);

-- MUX_uxn_opcodes_h_l576_c16_ce5f
MUX_uxn_opcodes_h_l576_c16_ce5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l576_c16_ce5f_cond,
MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue,
MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse,
MUX_uxn_opcodes_h_l576_c16_ce5f_return_output);

-- device_out_uxn_opcodes_h_l577_c23_a8f1
device_out_uxn_opcodes_h_l577_c23_a8f1 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l577_c23_a8f1_device_address,
device_out_uxn_opcodes_h_l577_c23_a8f1_value,
device_out_uxn_opcodes_h_l577_c23_a8f1_phase,
device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read,
device_out_uxn_opcodes_h_l577_c23_a8f1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l585_c24_7726
BIN_OP_AND_uxn_opcodes_h_l585_c24_7726 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left,
BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right,
BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223
is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output,
 deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output,
 MUX_uxn_opcodes_h_l570_c32_6218_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output,
 MUX_uxn_opcodes_h_l575_c16_65f7_return_output,
 MUX_uxn_opcodes_h_l576_c16_ce5f_return_output,
 device_out_uxn_opcodes_h_l577_c23_a8f1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l541_c3_818f : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_201f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_29c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9be4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_9418 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_e22c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_22d5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_ccd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_e9ef : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_6218_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_6218_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_6218_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_6218_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_65f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_65f7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_4708_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_c137_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_9d21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_0149_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_bc14_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_8db9_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_b64d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l587_c4_837e : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l590_c4_361f : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l594_l526_DUPLICATE_328c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_201f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_201f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_e9ef := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_e9ef;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_9418 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_9418;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_ccd5 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_ccd5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_29c3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_29c3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9be4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_9be4;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l541_c3_818f := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l541_c3_818f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_22d5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_22d5;
     VAR_MUX_uxn_opcodes_h_l570_c32_6218_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right := to_unsigned(128, 8);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l570_c32_6218_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_e22c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_e22c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l587_c4_837e := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l587_c4_837e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l575_c16_65f7_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left := t8;
     VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_da13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_left;
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output := BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_2a9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l552_c11_68eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output := result.device_ram_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_f6db_return_output := result.is_stack_index_flipped;

     -- MUX[uxn_opcodes_h_l576_c16_ce5f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l576_c16_ce5f_cond <= VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_cond;
     MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue <= VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iftrue;
     MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse <= VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_return_output := MUX_uxn_opcodes_h_l576_c16_ce5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_ca49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l565_c11_9b52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_left;
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output := BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l570_c32_ffa8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_left;
     BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output := BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_d32b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l556_c11_a75f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_left;
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output := BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c11_0d95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_503d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_f6db_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_ffa8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2a9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_503d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_ca49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_68eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_a75f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_0d95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_9b52_return_output;
     VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_d32b_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l590_c4_361f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_da13_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_0fec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c69a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_41e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_a054_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_c7d8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_8a79_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ed4a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c238_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_95eb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3727_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_value := VAR_MUX_uxn_opcodes_h_l576_c16_ce5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l590_c4_361f;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- MUX[uxn_opcodes_h_l575_c16_65f7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l575_c16_65f7_cond <= VAR_MUX_uxn_opcodes_h_l575_c16_65f7_cond;
     MUX_uxn_opcodes_h_l575_c16_65f7_iftrue <= VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iftrue;
     MUX_uxn_opcodes_h_l575_c16_65f7_iffalse <= VAR_MUX_uxn_opcodes_h_l575_c16_65f7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l575_c16_65f7_return_output := MUX_uxn_opcodes_h_l575_c16_65f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c07a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- l8_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- n8_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- t8_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l570_c32_1bb0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_left;
     BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output := BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l570_c32_6218_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_1bb0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_MUX_uxn_opcodes_h_l575_c16_65f7_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_device_address := VAR_MUX_uxn_opcodes_h_l575_c16_65f7_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c07a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_l8_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- MUX[uxn_opcodes_h_l570_c32_6218] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l570_c32_6218_cond <= VAR_MUX_uxn_opcodes_h_l570_c32_6218_cond;
     MUX_uxn_opcodes_h_l570_c32_6218_iftrue <= VAR_MUX_uxn_opcodes_h_l570_c32_6218_iftrue;
     MUX_uxn_opcodes_h_l570_c32_6218_iffalse <= VAR_MUX_uxn_opcodes_h_l570_c32_6218_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l570_c32_6218_return_output := MUX_uxn_opcodes_h_l570_c32_6218_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- printf_uxn_opcodes_h_l534_c3_977e[uxn_opcodes_h_l534_c3_977e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_977e_uxn_opcodes_h_l534_c3_977e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- l8_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue := VAR_MUX_uxn_opcodes_h_l570_c32_6218_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- l8_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     -- l8_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_l8_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- l8_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- l8_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- l8_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_51ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_51ed_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     -- device_out[uxn_opcodes_h_l577_c23_a8f1] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l577_c23_a8f1_device_address <= VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_device_address;
     device_out_uxn_opcodes_h_l577_c23_a8f1_value <= VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_value;
     device_out_uxn_opcodes_h_l577_c23_a8f1_phase <= VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_phase;
     device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output := device_out_uxn_opcodes_h_l577_c23_a8f1_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l581_c29_0149] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_0149_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.device_ram_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l583_c25_8db9] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_8db9_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l582_c26_bc14] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_bc14_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l578_c32_4708] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_4708_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l579_c31_c137] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_c137_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l580_c31_9d21] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_9d21_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.device_ram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l584_c23_b64d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_b64d_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_a8f1_return_output.vram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l585_l586_DUPLICATE_df2e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_c137_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_4708_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_bc14_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_b64d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_8db9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_9d21_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_0149_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_9223] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output := current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l586_c3_9223] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_cond;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output := is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l585_c24_7726] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_7726_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_9223_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_9223_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_2d2c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_2d2c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_ef04] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output := current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_ef04_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_d54d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d54d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_d8e1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_d8e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_dcec] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_dcec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_26d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_26d1_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_f6db] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_f6db_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l594_l526_DUPLICATE_328c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l594_l526_DUPLICATE_328c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5f30(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_f6db_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_f6db_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l594_l526_DUPLICATE_328c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l594_l526_DUPLICATE_328c_return_output;
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
