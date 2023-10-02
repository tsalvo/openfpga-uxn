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
-- BIN_OP_EQ[uxn_opcodes_h_l483_c6_1c75]
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_6627]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_cac7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l483_c2_65df]
signal t8_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l483_c2_65df]
signal n8_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l483_c2_65df]
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_65df]
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l484_c3_e4ea[uxn_opcodes_h_l484_c3_e4ea]
signal printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l491_c11_f6a2]
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l491_c7_cac7]
signal t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l491_c7_cac7]
signal n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l491_c7_cac7]
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_cac7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l495_c11_648a]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_908b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_3e8a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_1fe1]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_4e18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c7_908b]
signal n8_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_908b]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_908b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l504_c11_d6c1]
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_6082]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l504_c7_4e18]
signal n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l504_c7_4e18]
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : signed(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_4e18]
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l508_c32_6afb]
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l508_c32_cdea]
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l508_c32_47ee]
signal MUX_uxn_opcodes_h_l508_c32_47ee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_47ee_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_47ee_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_47ee_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_0d69]
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l512_c23_3e08]
signal device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_3e08_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_3e08_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_3e08_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_3e08_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_12be( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.device_ram_value := ref_toks_11;
      base.is_opc_done := ref_toks_12;
      base.vram_value := ref_toks_13;
      base.device_ram_address := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75
BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- t8_MUX_uxn_opcodes_h_l483_c2_65df
t8_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l483_c2_65df_cond,
t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- n8_MUX_uxn_opcodes_h_l483_c2_65df
n8_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l483_c2_65df_cond,
n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l483_c2_65df
device_out_result_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond,
device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df
result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df
result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

-- printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea
printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea : entity work.printf_uxn_opcodes_h_l484_c3_e4ea_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- t8_MUX_uxn_opcodes_h_l491_c7_cac7
t8_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- n8_MUX_uxn_opcodes_h_l491_c7_cac7
n8_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7
device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7
result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7
result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a
BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c7_3e8a
t8_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c7_3e8a
n8_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a
device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a
result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a
result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1
BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_908b
n8_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_908b_cond,
n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_908b
device_out_result_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b
result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b
result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1
BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output);

-- n8_MUX_uxn_opcodes_h_l504_c7_4e18
n8_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18
device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18
result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18
result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb
BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left,
BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right,
BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea
BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left,
BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right,
BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output);

-- MUX_uxn_opcodes_h_l508_c32_47ee
MUX_uxn_opcodes_h_l508_c32_47ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l508_c32_47ee_cond,
MUX_uxn_opcodes_h_l508_c32_47ee_iftrue,
MUX_uxn_opcodes_h_l508_c32_47ee_iffalse,
MUX_uxn_opcodes_h_l508_c32_47ee_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output);

-- device_out_uxn_opcodes_h_l512_c23_3e08
device_out_uxn_opcodes_h_l512_c23_3e08 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l512_c23_3e08_device_address,
device_out_uxn_opcodes_h_l512_c23_3e08_value,
device_out_uxn_opcodes_h_l512_c23_3e08_phase,
device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read,
device_out_uxn_opcodes_h_l512_c23_3e08_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output,
 n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output,
 BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output,
 MUX_uxn_opcodes_h_l508_c32_47ee_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output,
 device_out_uxn_opcodes_h_l512_c23_3e08_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_232e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_54e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_83b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_4f9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_47ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_47ee_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_5e1f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_83de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_f16c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_0635_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_6031_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_a18e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ce0a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_5d85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12be_uxn_opcodes_h_l523_l478_DUPLICATE_73ed_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_83b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_83b2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_54e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_54e2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_232e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_232e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_4f9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_4f9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right := to_unsigned(128, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := t8;
     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l508_c32_6afb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_left;
     BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output := BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_65df_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l491_c11_f6a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output := result.device_ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_908b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l504_c11_d6c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output := result.is_opc_done;

     -- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_0d69] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_left;
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output := BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_65df_return_output := result.is_stack_index_flipped;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_4e18_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_1fe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c11_648a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l483_c6_1c75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_left;
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output := BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left := VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_6afb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_1c75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f6a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_648a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_1fe1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_d6c1_return_output;
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_0d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8c23_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_ba98_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l495_l500_l504_DUPLICATE_e958_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l491_l495_l483_l500_DUPLICATE_ee47_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_3199_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_9251_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_0807_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_8d4d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_a18d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_65df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_65df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_908b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_6627] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output;

     -- n8_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l508_c32_cdea] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_left;
     BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output := BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l508_c32_47ee_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_cdea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_6627_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     -- MUX[uxn_opcodes_h_l508_c32_47ee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l508_c32_47ee_cond <= VAR_MUX_uxn_opcodes_h_l508_c32_47ee_cond;
     MUX_uxn_opcodes_h_l508_c32_47ee_iftrue <= VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iftrue;
     MUX_uxn_opcodes_h_l508_c32_47ee_iffalse <= VAR_MUX_uxn_opcodes_h_l508_c32_47ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l508_c32_47ee_return_output := MUX_uxn_opcodes_h_l508_c32_47ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output := n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- printf_uxn_opcodes_h_l484_c3_e4ea[uxn_opcodes_h_l484_c3_e4ea] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l484_c3_e4ea_uxn_opcodes_h_l484_c3_e4ea_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- t8_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue := VAR_MUX_uxn_opcodes_h_l508_c32_47ee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_t8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- n8_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- t8_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output := t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l483_c2_65df_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- n8_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_n8_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_6082] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output;

     -- n8_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output := n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_6082_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l483_c2_65df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- device_out[uxn_opcodes_h_l512_c23_3e08] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l512_c23_3e08_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l512_c23_3e08_device_address <= VAR_device_out_uxn_opcodes_h_l512_c23_3e08_device_address;
     device_out_uxn_opcodes_h_l512_c23_3e08_value <= VAR_device_out_uxn_opcodes_h_l512_c23_3e08_value;
     device_out_uxn_opcodes_h_l512_c23_3e08_phase <= VAR_device_out_uxn_opcodes_h_l512_c23_3e08_phase;
     device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l512_c23_3e08_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output := device_out_uxn_opcodes_h_l512_c23_3e08_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l517_c26_6031] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_6031_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.is_vram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l514_c31_83de] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_83de_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l518_c25_a18e] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_a18e_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.vram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l519_c23_ce0a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ce0a_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l516_c29_0635] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_0635_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.device_ram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l520_c24_5d85] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_5d85_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_f16c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_f16c_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l513_c32_5e1f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_5e1f_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_3e08_return_output.is_device_ram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_5d85_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_83de_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_5e1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_6031_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_ce0a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_a18e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_f16c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_0635_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_4e18] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_4e18_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_908b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_908b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l495_c7_3e8a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output := result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_3e8a_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output := device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_cac7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_65df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_cac7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l483_c2_65df] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_cond;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output := result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_12be_uxn_opcodes_h_l523_l478_DUPLICATE_73ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12be_uxn_opcodes_h_l523_l478_DUPLICATE_73ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_12be(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_65df_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_65df_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12be_uxn_opcodes_h_l523_l478_DUPLICATE_73ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12be_uxn_opcodes_h_l523_l478_DUPLICATE_73ed_return_output;
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
