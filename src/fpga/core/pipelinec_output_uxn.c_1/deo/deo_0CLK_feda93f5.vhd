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
-- Submodules: 92
entity deo_0CLK_feda93f5 is
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
end deo_0CLK_feda93f5;
architecture arch of deo_0CLK_feda93f5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l483_c6_5952]
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_a9bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_f10f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l483_c2_029a]
signal t8_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l483_c2_029a]
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l483_c2_029a]
signal n8_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(31 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_029a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l484_c3_4c0b[uxn_opcodes_h_l484_c3_4c0b]
signal printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l491_c11_9ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_eca6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l491_c7_f10f]
signal t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l491_c7_f10f]
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l491_c7_f10f]
signal n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_f10f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l495_c11_9692]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_b227]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c7_eca6]
signal t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c7_eca6]
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l495_c7_eca6]
signal n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_eca6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_7fa6]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_2816]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_b227]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l500_c7_b227]
signal n8_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_b227]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l504_c11_e7dc]
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_672f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l504_c7_2816]
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l504_c7_2816]
signal n8_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_2816]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l508_c32_bcac]
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l508_c32_af8d]
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l508_c32_5688]
signal MUX_uxn_opcodes_h_l508_c32_5688_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_5688_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_5688_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_5688_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_79e7]
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l512_c23_a038]
signal device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_a038_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_a038_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_a038_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_a038_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.device_ram_value := ref_toks_3;
      base.is_device_ram_read := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_stack_read := ref_toks_8;
      base.vram_value := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;
      base.device_ram_address := ref_toks_12;
      base.is_sp_shift := ref_toks_13;
      base.is_device_ram_write := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952
BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- t8_MUX_uxn_opcodes_h_l483_c2_029a
t8_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l483_c2_029a_cond,
t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l483_c2_029a
device_out_result_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond,
device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- n8_MUX_uxn_opcodes_h_l483_c2_029a
n8_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l483_c2_029a_cond,
n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a
result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a
result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

-- printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b
printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b : entity work.printf_uxn_opcodes_h_l484_c3_4c0b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3
BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- t8_MUX_uxn_opcodes_h_l491_c7_f10f
t8_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f
device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- n8_MUX_uxn_opcodes_h_l491_c7_f10f
n8_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f
result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f
result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692
BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c7_eca6
t8_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6
device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c7_eca6
n8_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6
result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6
result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6
BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_b227
device_out_result_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_b227
n8_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_b227_cond,
n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227
result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227
result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc
BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l504_c7_2816
device_out_result_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond,
device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- n8_MUX_uxn_opcodes_h_l504_c7_2816
n8_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l504_c7_2816_cond,
n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816
result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816
result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac
BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left,
BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right,
BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d
BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left,
BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right,
BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output);

-- MUX_uxn_opcodes_h_l508_c32_5688
MUX_uxn_opcodes_h_l508_c32_5688 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l508_c32_5688_cond,
MUX_uxn_opcodes_h_l508_c32_5688_iftrue,
MUX_uxn_opcodes_h_l508_c32_5688_iffalse,
MUX_uxn_opcodes_h_l508_c32_5688_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output);

-- device_out_uxn_opcodes_h_l512_c23_a038
device_out_uxn_opcodes_h_l512_c23_a038 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l512_c23_a038_device_address,
device_out_uxn_opcodes_h_l512_c23_a038_value,
device_out_uxn_opcodes_h_l512_c23_a038_phase,
device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read,
device_out_uxn_opcodes_h_l512_c23_a038_return_output);



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
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output,
 BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output,
 BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output,
 MUX_uxn_opcodes_h_l508_c32_5688_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output,
 device_out_uxn_opcodes_h_l512_c23_a038_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_8e96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4fc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_49bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_fc42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_b227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_5688_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_5688_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_5688_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_5688_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_024e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_cd9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_5895_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_2a21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_ad57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_7eef_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ef34_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_6458_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l523_l478_DUPLICATE_ba0b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_fc42 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_fc42;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l508_c32_5688_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4fc1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4fc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l508_c32_5688_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_8e96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_8e96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_49bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_49bc;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l495_c11_9692] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l491_c11_9ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_79e7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_left;
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output := BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l483_c6_5952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_left;
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output := BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_7fa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output := result.vram_address;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_029a_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_b227_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l504_c11_e7dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_2816_return_output := result.is_stack_read;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_029a_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output := result.device_ram_address;

     -- BIN_OP_AND[uxn_opcodes_h_l508_c32_bcac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_left;
     BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output := BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_bcac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_5952_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_9ca3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_9692_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_7fa6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_e7dc_return_output;
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_79e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_5854_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_e6c4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0f0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l504_l495_l500_DUPLICATE_1857_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_7179_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9c75_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cec1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_820a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a77e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a7a7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_029a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_029a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_b227_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l508_c32_af8d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_left;
     BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output := BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- n8_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output := n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_a9bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l508_c32_5688_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_af8d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_a9bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_n8_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     -- n8_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output := n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- MUX[uxn_opcodes_h_l508_c32_5688] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l508_c32_5688_cond <= VAR_MUX_uxn_opcodes_h_l508_c32_5688_cond;
     MUX_uxn_opcodes_h_l508_c32_5688_iftrue <= VAR_MUX_uxn_opcodes_h_l508_c32_5688_iftrue;
     MUX_uxn_opcodes_h_l508_c32_5688_iffalse <= VAR_MUX_uxn_opcodes_h_l508_c32_5688_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l508_c32_5688_return_output := MUX_uxn_opcodes_h_l508_c32_5688_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- t8_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- printf_uxn_opcodes_h_l484_c3_4c0b[uxn_opcodes_h_l484_c3_4c0b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l484_c3_4c0b_uxn_opcodes_h_l484_c3_4c0b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue := VAR_MUX_uxn_opcodes_h_l508_c32_5688_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     -- n8_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- t8_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output := t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l483_c2_029a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- n8_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_672f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output;

     -- n8_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output := n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_672f_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l483_c2_029a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- device_out[uxn_opcodes_h_l512_c23_a038] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l512_c23_a038_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l512_c23_a038_device_address <= VAR_device_out_uxn_opcodes_h_l512_c23_a038_device_address;
     device_out_uxn_opcodes_h_l512_c23_a038_value <= VAR_device_out_uxn_opcodes_h_l512_c23_a038_value;
     device_out_uxn_opcodes_h_l512_c23_a038_phase <= VAR_device_out_uxn_opcodes_h_l512_c23_a038_phase;
     device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l512_c23_a038_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output := device_out_uxn_opcodes_h_l512_c23_a038_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l516_c29_2a21] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_2a21_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.device_ram_value;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l519_c23_ef34] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ef34_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l520_c24_6458] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_6458_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_5895] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_5895_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l514_c31_cd9e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_cd9e_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.is_device_ram_read;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l517_c26_ad57] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_ad57_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output := device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l518_c25_7eef] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_7eef_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l513_c32_024e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_024e_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_a038_return_output.is_device_ram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_6458_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_cd9e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_024e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_ad57_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ef34_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_7eef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_5895_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_2a21_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_2816] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_2816_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_b227] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_b227_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c7_eca6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_eca6_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output := device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_f10f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_029a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_f10f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_029a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l523_l478_DUPLICATE_ba0b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l523_l478_DUPLICATE_ba0b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_029a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_029a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l523_l478_DUPLICATE_ba0b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l523_l478_DUPLICATE_ba0b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
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
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
